FROM ubuntu:22.04

WORKDIR /app

COPY . /app

# Install dependencies and update certificates, clean up apt cache, 
RUN apt-get update \
 && apt-get install -y \
      ca-certificates curl jq openjdk-21-jre-headless bash \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /app/scripts/entrypoint.sh


EXPOSE 25565

# start script
ENTRYPOINT ["/bin/bash", "-c", "/app/scripts/entrypoint.sh"]

