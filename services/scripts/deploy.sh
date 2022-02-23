#!/usr/bin/env sh

set -x
cd app/graphql
npm run build
npm start
set +x