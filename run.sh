#!/bin/bash
# Author: Michal Svorc <michalsvorc.com>
# Run docker container with predefined mount directories

# Image variables
image_repository='michalsvorc'
image_name='gimp'
image_tag=$(git describe --tags --abbrev=0)
user_name=$image_name

# Mount variables
mount_path="${PWD}"
dir_workspace_host="${mount_path}/workspace"
dir_profile_host="${mount_path}/profile"
dir_workspace_container="/home/$user_name/workspace"
dir_profile_container="/home/$user_name/.config/GIMP/$image_tag"

# Create host mount directories
mkdir -p $dir_workspace_host $dir_profile_host

# Run
docker run \
    -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=$dir_workspace_host,target=$dir_workspace_container \
    --mount type=bind,source=$dir_profile_host,target=$dir_profile_container \
    --name $image_repository-$image_name-$image_tag \
    $image_repository/$image_name:$image_tag
