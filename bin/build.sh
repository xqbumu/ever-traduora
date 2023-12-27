#!/bin/sh

set -e

bin/install-deps.sh

# Cleanup
[ -e dist ] && rm -r dist

# Build webapp
cd webapp && yarn build --configuration production --base-href /i18n/ --deploy-url /i18n/

# Build api
cd ../api && yarn build
cp -r node_modules ../dist/
