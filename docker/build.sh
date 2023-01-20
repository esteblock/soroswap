#!/bin/bash

set -e
containerName=soroswap-release5
imageName=soroswap-release5
versionTag=0.0.1.dev1

echo "Searching for a previous docker container"
containerID=$(docker ps --filter="name=${containerName}" --all --quiet)
if [[ ${containerID} ]]; then
    echo "Start removing container."
    docker rm --force ${containerName}
    echo "Finished removing container."
else
    echo "No previous container was found"
fi

echo "Searching for a previously built docker image."
foundImageIDs=$(docker images ${imageName}:${versionTag} --quiet)
if [[ $foundImageIDs ]]; then
    echo "Start removing image."
    # docker rmi --force $(docker images ${imageName}:${versionTag} --quiet)
    docker rmi --force ${imageName}:${versionTag}
    echo "Finished removing image."
else
    echo "No previous images were found."
fi


# Build image and tag it with image name and version
docker build . \
    --tag ${imageName}:${versionTag} \
    --force-rm \
    --rm
