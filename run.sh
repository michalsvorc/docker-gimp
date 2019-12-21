#!/bin/bash
# Author: Michal Svorc <michal@svorc.com>
# Run docker container

# Declare base variables
. ./.config --source-only

# Interpolate additional variables
image_tag="$gimp_version"
user_name=$image_name
mount_path="${PWD}/mount"

# Control service permission to make connections to the X server
# Requires system xorg-xhost package
xhost_switch() {
    local switch_value=$1
    local service=$2

    if $switch_value; then
        xhost +local:$service
    else
        xhost -local:$service
    fi
}

# Run
xhost_switch true 'docker' \
&& docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=$mount_path/workspace,target=/home/$user_name/workspace \
    --mount type=bind,source=$mount_path/profile,target=/home/$user_name/.config/GIMP/$gimp_version \
    --name $image_repository-$image_name-$image_tag-rm \
    $image_repository/$image_name:$image_tag \
; xhost_switch false 'docker'
