#!/usr/bin/env bash

echo "bootstrapping.."

set -e
set -v

sudo su

useradd --no-create-home -d /var/task -s /bin/bash sbx_user1000
echo "lambda" | passwd sbx_user1000 --stdin

dnf install nodejs.x86_64 -y

set +v
echo "done."
