#!/usr/bin/env sh

set -x
cd app/graphql
echo "Hola"
npm run build
npm start
set +x