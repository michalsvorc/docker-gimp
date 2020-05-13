#!/bin/bash
# Author: Michal Svorc <michalsvorc.com>
# Run Docker container

# Source Docker arguments
source ./.config

# Docker run
docker run \
    -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=$mount_profile_source,target=$mount_profile_target \
    --mount type=bind,source=$mount_workspace_source,target=$mount_workspace_target \
    --name $container_name \
    $image_name:$image_tag
