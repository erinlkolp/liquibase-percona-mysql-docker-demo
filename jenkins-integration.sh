#!/bin/bash
set -e

docker-compose build
echo ""
docker-compose up -d
echo ""

sleep 30

echo ""
docker exec liquibase liquibase update
echo ""
