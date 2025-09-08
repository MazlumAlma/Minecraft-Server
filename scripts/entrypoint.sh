#!/usr/bin/env bash
set -Eeuo pipefail

SERVER_DIR="${SERVER_DIR:-/server}"
mkdir -p "$SERVER_DIR"
cd "$SERVER_DIR"

# set EULA 
EULA_VAL="${EULA:-true}"
printf "eula=%s\n" "${EULA_VAL,,}" > eula.txt

# RAM-Defaults
XMS_VALUE="${XMS:-1G}"
XMX_VALUE="${XMX:-2G}"


exec java -Xms"$XMS_VALUE" -Xmx"$XMX_VALUE" ${JVM_OPTS:-} -jar server.jar nogui
