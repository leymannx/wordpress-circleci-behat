#!/usr/bin/env bash

# Set script to exit on errors.
set -e

# Get script's absolute location.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to repo root.
cd ${DIR};
cd ../..

# Git pull, composer install.
git fetch --prune
git branch -a
git status
if [ -n "$1" ]; then
  git reset --hard "$1"
else
  git pull
fi
composer install --no-interaction --no-dev --prefer-dist

# Site-wise routine.
cd web/
../bin/wp --info
