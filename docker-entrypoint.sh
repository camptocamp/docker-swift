#!/bin/sh

set -e

echo "PIPE_NAME=${PIPE_NAME}"

echo "OS_AUTH_URL=${OS_AUTH_URL}"
echo "OS_TENANT_NAME=${OS_TENANT_NAME}"
echo "OS_USERNAME=${OS_USERNAME}"
echo "OS_PASSWORD=${OS_PASSWORD}"

mkfifo "${PIPE_NAME}"

token=$(curl -d "{\"auth\": {\"tenantName\": \"${OS_TENANT_NAME}\", \"passwordCredentials\":{\"username\": \"${OS_USERNAME}\", \"password\": \"${OS_PASSWORD}\"}}}" -H "Content-type: application/json" ${OS_AUTH_URL}/tokens | python -c "import sys; import json; print(json.load(sys.stdin)['access']['token']['id'])")

echo "token=${token}"

curl -H "X-Auth-Token: ${token}" $* > "${PIPE_NAME}"
