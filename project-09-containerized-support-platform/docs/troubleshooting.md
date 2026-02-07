# Troubleshooting Guide

## Ollama Takes Long to Start

Ollama may take several minutes on first startup while pulling the model.

This is expected behavior.

Once downloaded, future startups are significantly faster.



## Ollama Shows as Unhealthy Initially

During model loading, the container may temporarily appear unhealthy.

Wait until the model finishes loading and recheck container status.



## API Returns 404 Errors

Ensure the correct endpoint is used.

Valid endpoints:
- /health
- /support

Verify the support API container is running and healthy.


## Voice UI Cannot Reach API

Check the following:
- Support API is running on port 8000
- CORS is enabled in FastAPI
- Browser is accessing http://localhost:8080



## Docker Build Failures

If builds fail unexpectedly:
- Run `docker compose down`
- Run `docker compose build --no-cache`
- Run `docker compose up -d`