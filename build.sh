#!/bin/bash
name="mkgmap"
tag=`date +%Y%m%d%H%M`
release_build=false

if [ "$1" == "release" ]; then
    echo "Release build."
    release_build=true
fi

docker build --tag "peatfaerie/${name}:${tag}"  --no-cache=${release_build} .

if [ $release_build == true ]; then
	docker tag "peatfaerie/${name}:${tag}" "peatfaerie/${name}:latest"
fi
