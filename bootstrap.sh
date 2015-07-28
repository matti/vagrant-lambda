#!/usr/bin/env bash

echo "bootstrapping.."

set -e
set -v

sudo su
dnf install nodejs.x86_64 -y

set +v
echo "done."
