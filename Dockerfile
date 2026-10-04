FROM ubuntu:latest

# Installation des paquets et dépendances nécessaires
RUN apt-get update && apt-get install -y \
    python3 \
    ttyd \
    bash \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Variable de port gérée par Render
ENV PORT=8080
EXPOSE 8080

# Lancer ttyd directement sur le port principal avec l'index HTML personnalisé
CMD ttyd -p $PORT -i index.html -W bash

