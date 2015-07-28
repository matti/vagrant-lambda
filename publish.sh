#!/usr/bin/env bash

set -e
set -v

ATLAS_TOKEN=$1
USER=$2
BOX=$3
VERSION=$4
USERBOX=$USER/$BOX


curl https://atlas.hashicorp.com/api/v1/boxes \
        -X POST \
        -d box[name]="$BOX" \
        -d access_token="$ATLAS_TOKEN"

curl https://atlas.hashicorp.com/api/v1/box/$USERBOX/versions \
        -X POST \
        -d version[version]="$VERSION" \
        -d access_token="$ATLAS_TOKEN"

curl https://atlas.hashicorp.com/api/v1/box/$USERBOX/version/$VERSION/providers \
        -X POST \
        -d provider[name]='virtualbox' \
        -d access_token="$ATLAS_TOKEN"

UPLOAD_PATH=$(curl -sS https://atlas.hashicorp.com/api/v1/box/$USERBOX/version/$VERSION/provider/virtualbox/upload?access_token=$ATLAS_TOKEN | jq -r '.upload_path')

curl -v -X PUT --upload-file package.box $UPLOAD_PATH

curl https://atlas.hashicorp.com/api/v1/box/$USERBOX/version/$VERSION/release \
        -X PUT \
        -d access_token="$ATLAS_TOKEN"

curl https://atlas.hashicorp.com/api/v1/box/$USERBOX \
        -X PUT \
        -d box[is_private]=false \
        -d access_token="$ATLAS_TOKEN"
        
