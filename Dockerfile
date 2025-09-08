FROM ubuntu:22.04

WORKDIR /app

COPY . /app

# Install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates curl jq openjdk-21-jre-headless bash \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

 

RUN chmod +x /app/scripts/entrypoint.sh

# Create /server 
RUN mkdir -p /server

EXPOSE 25565

# EntryPoint
ENTRYPOINT ["/app/scripts/entrypoint.sh"]
