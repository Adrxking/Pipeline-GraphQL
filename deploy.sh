#!/bin/bash

cd /app
cp /tmp/environments/.env ./.env
ls -la /app
cat /app/.env
npm run start