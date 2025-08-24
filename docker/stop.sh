#!/bin/bash
set -e

echo "🛑 Stopping ERPNext site 'erpsb1'..."
docker compose -p erpsb1 -f docker-compose.erp-sb1.yml down

echo "🛑 Stopping proxy..."
docker compose -f docker-compose.proxy.yml down

echo "🛑 Stopping core services..."
docker compose -f docker-compose.core.yml down

echo ""
echo "✅ All services have been stopped."