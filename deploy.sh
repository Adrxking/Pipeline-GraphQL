#!/bin/bash

mv /tmp/environments/.env /app/.env
echo "Comete una berga" >> /app/.env
cd /app
npm run start