#!/usr/bin/env bash

rm -rf .vagrant
vagrant up

rm package.box
vagrant package

echo "atlas-publish/publish.sh TOKEN matti lambda 0.0.3"
