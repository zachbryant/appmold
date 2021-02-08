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

if [[ $CLIENT ]]; then
    git clone --recursive $CLIENT ./client
    rm -rf ./client/.git
    git add ./client
fi

if [[ $SERVER ]]; then
    git clone --recursive $SERVER ./server
    rm -rf ./server/.git
    git add ./server
fi
