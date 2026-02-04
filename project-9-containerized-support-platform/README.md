### Project 9: Containerized Voice Support Platform

### Overview

This project demonstrates a fully local, containerized, voice enabled support platform built using Docker Compose.
The platform allows a user to interact with a support agent through a browser based voice interface while all backend processing and AI inference run locally on the developer machine.

The goal of this project is to showcase practical Docker fundamentals, service to service communication, health checks, container orchestration, and local AI inference without reliance on external cloud services.



### Architecture Summary

The solution runs entirely on a developer laptop using Docker Compose and a Docker bridge network.

A browser based Voice UI communicates with a FastAPI backend running inside a container.
The backend processes requests and performs local inference using the Ollama LLM runtime.
Generated responses are returned to the browser and spoken back to the user using browser speech synthesis.

The full system design, service boundaries, and request flow are documented using an architecture diagram.

### Architecture Diagram

The diagram below illustrates the complete containerized architecture, including service interactions, exposed ports, and data flow between components.

The diagram is located in the diagram directory.

diagram/Docker-Architecture.png


### Technologies Used

This project was built using Docker and Docker Compose for container orchestration.
FastAPI and Uvicorn are used for the backend API service.
Ollama is used for local large language model inference.
Nginx serves the browser based voice interface.
HTML and JavaScript provide the frontend logic.
Browser speech recognition and speech synthesis APIs are used for voice input and output.



### Services Overview

## Support API

The Support API is built using FastAPI and runs on Uvicorn inside a Docker container.
It exposes endpoints for health checks and support requests and contains the core business logic for handling user queries and generating responses.

The service listens on port 8000.



## Ollama LLM Runtime

Ollama provides local large language model inference for the platform.
The llama3.2:3b model is downloaded once during the initial setup and reused through Docker volume storage.
After the first pull, no internet access is required for inference.

The service listens on port 11434.



## Voice UI

The Voice UI is a browser based interface served by Nginx.
It supports speech recognition, text display, API communication with the backend, and speech synthesis for responses.

The service is exposed on port 8080.



## n8n Workflow Engine

n8n is included as an optional service to allow future workflow automation and integrations.
It is not part of the core request response flow in this project and is included for extensibility.

The service listens on port 5678.


### Folder Structure

The project follows a clear and modular structure.

project-9-containerized-support-platform/
├── agent-api
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── voice-ui
│   ├── index.html
│   └── nginx.conf
├── diagram
│   └── Docker-Architecture.png
├── docker-compose.yml
├── .env
├── .gitignore
├── README.md
└── docs



### How to Run the Project

How to Run the Project

Ensure Docker Desktop is installed and running on the local machine.

From the project root directory, start all services using Docker Compose:docker compose up -d

During the first run, Ollama will take additional time to download the language model.
Subsequent runs will start significantly faster because the model is reused from local storage.


### Accessing the Application

Accessing the Application

The Voice UI can be accessed at:

http://localhost:8080

The API health endpoint can be accessed at:

http://localhost:8000/health

The n8n interface can be accessed at:

http://localhost:5678


### Validation Steps

The API health endpoint was tested and returned a successful response.
The Voice UI loaded correctly in the browser.
Speech recognition successfully captured user input.
The backend processed support requests without errors.
Responses were returned correctly and spoken back to the user.
All containers reported a healthy running state using Docker Compose.

### Cleanup

All services can be stopped and removed using Docker Compose:docker compose down

No external cloud resources were created during this project.
There are no ongoing infrastructure or service costs.


### Project Status

This project has been completed successfully.
All required functionality is working as expected.
The platform is stable and ready for demonstration, documentation, or future extension.