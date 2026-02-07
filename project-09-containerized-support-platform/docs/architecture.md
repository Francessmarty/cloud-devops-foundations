# Architecture Documentation

## Overview

This document describes the internal architecture of the Containerized Voice Support Platform.

The system is designed to run entirely on a developer machine using Docker Compose.  
All services communicate over a Docker bridge network with no external dependencies.



## Components

### User Browser

The user accesses the platform through a local browser using Chrome or Edge.  
The browser provides speech recognition and speech synthesis capabilities.



### Voice UI

The Voice UI is a static web interface served by Nginx.

Responsibilities:
- Captures user speech
- Sends requests to the support API
- Displays agent responses
- Converts responses to speech

Port: 8080



### Support API

The Support API is built with FastAPI and runs on Uvicorn.

Responsibilities:
- Exposes health and support endpoints
- Applies business logic
- Forwards requests to the LLM runtime
- Returns generated responses

Port: 8000



### Ollama LLM Runtime

Ollama provides local large language model inference.

Responsibilities:
- Loads the llama3.2:3b model
- Performs inference locally
- Returns generated text responses

Model data is stored using Docker volumes to avoid repeated downloads.

Port: 11434



### n8n Workflow Engine

n8n is included as an optional component for future workflow automation.  
It is not part of the core request-response flow.

Port: 5678



## Networking

All containers communicate over a Docker bridge network created by Docker Compose.

No service is exposed publicly beyond the local machine.



## Data Flow

1. User speaks into the browser
2. Voice UI sends a request to the Support API
3. Support API forwards the request to Ollama
4. Ollama generates a response
5. Response is returned to the Support API
6. Voice UI displays and speaks the response