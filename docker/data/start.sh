#!/bin/bash

DB_HOST="${SERVER_DB_HOST:-mysql}"
DB_USER="${SERVER_DB_USER:-otserver}"
DB_PASSWORD="${SERVER_DB_PASSWORD:-otserver}"
DB_DATABASE="${SERVER_DB_DATABASE:-otserver}"
OT_SERVER_IP="${SERVER_IP:-127.0.0.1}"
OT_SERVER_LOGIN_PORT="${SERVER_LOGIN_PORT:-7171}"
OT_SERVER_GAME_PORT="${SERVER_GAME_PORT:-7172}"
OT_SERVER_STATUS_PORT="${SERVER_STATUS_PORT:-7171}"

echo ""
echo "===== Print Variables ====="
echo ""

echo "DB_HOST:[$DB_HOST]"
echo "DB_USER:[$DB_USER]"
echo "DB_PASSWORD:[$DB_PASSWORD]"
echo "DB_DATABASE:[$DB_DATABASE]"
echo "OT_SERVER_IP:[$OT_SERVER_IP]"
echo "OT_SERVER_LOGIN_PORT:[$OT_SERVER_LOGIN_PORT]"
echo "OT_SERVER_GAME_PORT:[$OT_SERVER_GAME_PORT]"
echo "OT_SERVER_STATUS_PORT:[$OT_SERVER_STATUS_PORT]"

echo ""
echo "================================"
echo ""

mv /tmp/otserver/config.lua.dist /tmp/otserver/config.lua

sed -i '/mysqlHost = .*$/c\mysqlHost = "'$DB_HOST'"' /tmp/otserver/config.lua
sed -i '/mysqlUser = .*$/c\mysqlUser = "'$DB_USER'"' /tmp/otserver/config.lua
sed -i '/mysqlPass = .*$/c\mysqlPass = "'$DB_PASSWORD'"' /tmp/otserver/config.lua
sed -i '/mysqlDatabase = .*$/c\mysqlDatabase = "'$DB_DATABASE'"' /tmp/otserver/config.lua
sed -i '/ip = .*$/c\ip = "'$OT_SERVER_IP'"' /tmp/otserver/config.lua
sed -i '/loginProtocolPort = .*$/c\loginProtocolPort = '$OT_SERVER_LOGIN_PORT'' /tmp/otserver/config.lua
sed -i '/gameProtocolPort = .*$/c\gameProtocolPort = '$OT_SERVER_GAME_PORT'' /tmp/otserver/config.lua
sed -i '/statusProtocolPort = .*$/c\statusProtocolPort = '$OT_SERVER_STATUS_PORT'' /tmp/otserver/config.lua

echo ""
echo "===== Server Configuration ====="
echo ""

cat /tmp/otserver/config.lua
