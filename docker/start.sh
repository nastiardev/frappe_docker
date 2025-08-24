#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# --- 1. Setup Shared Network ---
# Check if the network 'proxy_network' exists. If not, create it.
if ! docker network inspect proxy_network >/dev/null 2>&1; then
  echo "✅ Creating 'proxy_network'..."
  docker network create proxy_network
else
  echo "👍 'proxy_network' already exists."
fi

# --- 2. Launch Core Services ---
echo "🚀 Starting core services (DB, Redis)..."
docker compose -f docker-compose.core.yml up -d

# --- 3. Launch Proxy ---
echo "🚀 Starting proxy (Traefik)..."
docker compose -f docker-compose.proxy.yml up -d

# --- 4. Launch ERPNext Site ---
echo "🚀 Starting ERPNext site 'erpsb1'..."
docker compose -p erpsb1 -f docker-compose.erp.yml up -d

echo ""
echo "🎉 All services are up and running!"