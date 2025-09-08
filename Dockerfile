FROM ubuntu:22.04

WORKDIR /app
COPY . /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates curl jq openjdk-21-jre-headless bash \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /server \
 && chmod +x /app/scripts/entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/app/scripts/entrypoint.sh"]