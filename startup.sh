#!/bin/bash

# https://megamek.org/wiki/ded_servers.html
# adjust Java memory as needed
java -Xmx512m -jar MegaMek.jar -dedicated -port $SERVER_PORT -password $SERVER_PASSWORD &
# give the server a few seconds to start up
sleep 10
tail -f /logs/megamek.log