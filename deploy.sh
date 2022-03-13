#!/bin/bash

cd /app
cp /tmp/environments/.env ./.env
ls -la /app
cat /app/.env
npx prisma generate
npm run start