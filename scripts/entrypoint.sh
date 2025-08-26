#!/usr/bin/env bash
set -Eeuo pipefail

mkdir -p /server
cd /server

#1) server.jar download if needed
if [[ ! -f server.jar ]]; then

  URL="https://piston-meta.mojang.com/mc/game/version_manifest_v2.json"
  LATEST_URL="$(curl "$URL" \
    | jq -r '.latest.release as $rel | .versions[] | select(.id==$rel) | .url')"

  SERVER_URL="$(curl "$LATEST_URL" | jq -r '.downloads.server.url')"
fi

#2) Accept EULA licence
echo "eula=true"  > eula.txt

#3) memory configuration
XMS_VALUE=${XMS:-1G}
XMX_VALUE=${XMX:-2G}


#4) start the java server
exec java -Xms"$XMS_VALUE" -Xmx"$XMX_VALUE" ${JVM_OPTS:-} -jar server.jar nogui
