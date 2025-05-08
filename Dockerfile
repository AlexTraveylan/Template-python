ARG PYTHON_VERSION=3.13.0
FROM python:${PYTHON_VERSION}-slim as builder

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1
ENV UV_CACHE_DIR=/app/.cache/uv

WORKDIR /app

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the source code into the container.
COPY . .

# Create cache directory with proper permissions
RUN mkdir -p ${UV_CACHE_DIR} && \
    chmod -R 777 /app/.cache

# Install dependencies using uv from pyproject.toml
RUN uv sync

# Set proper permissions
RUN chown -R appuser:appuser /app

# Switch to the non-privileged user to run the application.
USER appuser

# KEEP THE CMD YOU WANT TO USE AND DELETE THE OTHER

# Job
CMD ["uv", "run", "src/main.py"]

# Fast API
# CMD ["/app/.venv/bin/fastapi", "run", "src/main.py", "--port", "8000", "--host", "0.0.0.0"]
