#!/usr/bin/env bash
set -Eeuo pipefail

cd /server

#1) Accept EULA licence
echo "eula=true"  > eula.txt

#2) memory configuration
XMS_VALUE=${XMS:-1G}
XMX_VALUE=${XMX:-2G}


#3) start the java server
exec java -Xms"$XMS_VALUE" -Xmx"$XMX_VALUE" ${JVM_OPTS:-} -jar server.jar nogui

