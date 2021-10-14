#!/bin/bash

USAGE="Usage: ./clone.sh [-s|--server]=... [-c|--client]=..."

for i in "$@"; do
case $i in
    -s=*|--server=*)
    SERVER="${i#*=}"
    shift # past argument=value
    ;;
    -c=*|--client=*)
    CLIENT="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
	  echo $USAGE
	  exit 1
    ;;
esac
done

if [[ ! $CLIENT ]] && [[ ! $SERVER ]]; then
	echo $USAGE
	exit 1
fi

TEMPLATE_REMOTE_NAME="template-upstream"
git remote add $TEMPLATE_REMOTE_NAME git@github.com:zachbryant/appmold.git

if [[ $CLIENT ]]; then
    git submodule add $CLIENT ./client
    cd ./client
    git remote add $TEMPLATE_REMOTE_NAME $CLIENT
    cd ..
    git add ./client
fi

if [[ $SERVER ]]; then
    git submodule add $SERVER ./server
    cd ./server
    git remote add $TEMPLATE_REMOTE_NAME $SERVER
    cd ..
    git add ./server
fi
