from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
import httpx

app = FastAPI(title="Containerized Support API")

# Allow the browser UI (nginx on 8080) to call the API (8000)
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:8080",
        "http://127.0.0.1:8080",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Message(BaseModel):
    text: str

@app.get("/health")
def health():
    return {"status": "ok"}

def rule_based_reply(text_lower: str) -> str:
    if "login" in text_lower or "password" in text_lower:
        return "Okay. Try resetting your password and confirm your email address is correct."
    elif "slow" in text_lower or "down" in text_lower:
        return "Understood. First check if it affects everyone, then restart the app. If it is still slow, tell me the exact error."
    elif "docker" in text_lower:
        return "Confirm Docker Desktop is running and share the exact error message."
    elif "port" in text_lower:
        return "Which URL are you trying to open? What message can you see on docker logs?."
    else:
        return "Thanks. Please describe what you were trying to do and what happened."

def build_prompt(user_text: str) -> str:
    # Keep it short and “support agent” style (works well for demos)
    return (
        "You are an IT support assistant. Ask 1-2 clarifying questions if needed, "
        "then give clear step-by-step troubleshooting. Keep it concise.\n\n"
        f"User: {user_text}\n"
        "Assistant:"
    )

def try_ollama(user_text: str) -> str | None:
    llm_provider = os.getenv("LLM_PROVIDER", "").lower().strip()
    if llm_provider != "ollama":
        return None

    ollama_url = os.getenv("OLLAMA_URL", "http://ollama:11434").rstrip("/")
    model = os.getenv("OLLAMA_MODEL", "llama3.2:3b")

    prompt = build_prompt(user_text)

    try:
        # Ollama native REST API
        with httpx.Client(timeout=20.0) as client:
            resp = client.post(
                f"{ollama_url}/api/generate",
                json={
                    "model": model,
                    "prompt": prompt,
                    "stream": False,
                },
            )
            resp.raise_for_status()
            data = resp.json()
            answer = (data.get("response") or "").strip()
            return answer if answer else None
    except Exception:
        # If Ollama is down / model missing / network issue, fall back gracefully
        return None

@app.post("/support")
def support(msg: Message):
    user_text = msg.text.strip()
    if not user_text:
        return {"reply": "Please type a message so I can help."}

    # 1) Try real AI (Ollama) if enabled
    ai_reply = try_ollama(user_text)
    if ai_reply:
        return {"reply": ai_reply}

    # 2) Fall back to your rules (always works)
    return {"reply": rule_based_reply(user_text.lower())}