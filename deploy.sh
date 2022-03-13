#!/bin/bash

cd /app

docker cp .env graphql-prisma-graphql:.env

npm run start