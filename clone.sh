#!/bin/bash

USAGE="Usage: ./clone.sh <git url>"

REPO_URL="$1"

if [[ ! $REPO_URL ]]; then
	echo $USAGE
	exit 1
fi

TEMPLATE_REMOTE_NAME="template-upstream"
APPMOLD_TEMPLATE_REMOTE_NAME="template-upstream-appmold"

git remote add $TEMPLATE_REMOTE_NAME $REPO_URL
git remote add $APPMOLD_TEMPLATE_REMOTE_NAME git@github.com:zachbryant/appmold.git
git clone $REPO_URL .

echo "If you cloned manually, run: git remote set-url origin <new url>"
