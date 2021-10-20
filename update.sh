#!/bin/bash

USAGE="Usage: ./update.sh"

BRANCH="template-update-$(git rev-parse --short HEAD)"
git fetch --all -p
git checkout -b $BRANCH || git checkout $BRANCH
git pull template-upstream master --allow-unrelated-histories
