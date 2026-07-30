FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    gnupg \
    python3 \
    python3-pip \
    git \
    build-essential \
    nodejs \
    npm \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@latest || true

WORKDIR /workspace
