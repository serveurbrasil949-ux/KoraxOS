FROM ubuntu:latest

# Installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
    python3 \
    ttyd \
    bash \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Port par défaut si la variable PORT n'est pas définie
ENV PORT=10000

# Lancement de ttyd en utilisant la variable $PORT de Render
CMD ttyd -p ${PORT:-10000} -i index.html -W bash

