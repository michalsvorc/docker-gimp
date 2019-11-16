#!/bin/bash
# Author: Michal Svorc <michal@svorc.sk>
# Run docker container

# Declare base variables
DOCKER_TAG=2.10
app_name=gimp
dockerhub_namespace=michalsvorc

# Interpolate additional variables
image_name=$dockerhub_namespace/$app_name:$DOCKER_TAG
container_name=$dockerhub_namespace-$app_name-$DOCKER_TAG
mount_path="${PWD}/mount"
user_name=$app_name

# Control appliacation permission to make connections to the X server
# Requires system xorg-xhost package
xhost_switch() {
    local switch_value=$1
    local application=$2

    if $switch_value; then
        xhost +local:$application
    else
        xhost -local:$application
    fi
}

# Run
xhost_switch true 'docker' \
&& docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=$mount_path/workspace,target=/home/$user_name/workspace \
    --mount type=bind,source=$mount_path/profile,target=/home/$user_name/.config/GIMP/$DOCKER_TAG \
    --name $container_name \
    $image_name \
; xhost_switch false 'docker'
