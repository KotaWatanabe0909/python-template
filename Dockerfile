FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /workspace
COPY requirements-dev.txt .

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    uv venv && \
    uv pip install --no-cache-dir -r /workspace/requirements-dev.txt && \
    echo "source /opt/.venv/bin/activate" >> /etc/bash.bashrc
