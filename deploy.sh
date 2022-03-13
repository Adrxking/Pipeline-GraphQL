#!/bin/bash

cp /tmp/environments/.env /app/.env
echo "Comete una verga" >> /tmp/environments/.env
cd /app
ls -la /app
npm run start