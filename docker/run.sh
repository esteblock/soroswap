currentDir=$(pwd)

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

# TODO : Check ports of nodes, avalanche, etc
docker run --volume  ${currentDir}/..:/workspace \
           --name ${containerName} \
           --net container:stellar \
           --interactive \
           --tty \
           --detach \
           --ipc=host \
           ${imageName}:${versionTag}
