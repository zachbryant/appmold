#!/bin/bash

USAGE="Usage: ./update.sh [-s] [-c]"

for i in "$@"; do
case $i in
    -s)
    SERVER=1
    shift # past argument=value
    ;;
    -c)
    CLIENT=1
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

update() {
	cd $1
	BRANCH="template-update-$(git rev-parse --short HEAD)"
	git fetch --all -p
	git checkout -b $BRANCH
	git pull template-upstream master --allow-unrelated-histories
	cd ..
}


if [[ $CLIENT ]]; then
    update "./client"
fi

if [[ $SERVER ]]; then
    update "./server"
fi
