FROM ubuntu:latest

# Installation des outils de base, Python et ttyd
RUN apt-get update && apt-get install -y \
    python3 \
    ttyd \
    bash \
    curl \
    git

WORKDIR /app
COPY . /app

# Exposer le port de communication
EXPOSE 8080

# Lancer ttyd et le serveur web
CMD ttyd -p 8081 -W bash & python3 -m http.server 8080

