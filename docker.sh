#!/usr/bin/env bash
# Author: Michal Svorc <michalsvorc.com>
# Description: Docker commands helper script

#===============================================================================
# Script options
#===============================================================================

set -o errexit      # abort on nonzero exitstatus
set -o nounset      # abort on unbound variable
set -o pipefail     # don't hide errors within pipes
# set -o xtrace     # debugging

#===============================================================================
# Variables
#===============================================================================

# Docker arguments
application_name='gimp'
image_name="michalsvorc/${application_name}"
image_tag=$(git describe --tags --abbrev=0)

container_name="${application_name}-${image_tag}"

mount_profile_source="${PWD}/profile"
mount_profile_target="/home/user/.config/GIMP/$image_tag"

mount_workspace_source="${PWD}/workspace"
mount_workspace_target="/home/user/workspace"

#===============================================================================
# Help
#===============================================================================

_print_help() {
cat <<HELP
Usage: ./docker.sh [COMMAND]

Docker commands helper script

Commands:
    -h|--help       print this help text and exit
    build           build Docker image
    run             run Docker image
    start           start Docker container

HELP
}

#===============================================================================
# Functions
#===============================================================================

_die() {
    local error_message="${1}"
    printf 'Error: %s\nSee help for proper usage:\n\n' "${error_message}" >&2
	_print_help
    exit 1
}

_docker_build() {
    printf 'Docker build image %s\n' "${image_name}:${image_tag}"

    docker build \
        --build-arg app_version="${image_tag}" \
        --tag "${image_name}:${image_tag}" \
        .
}

_docker_run() {
    printf 'Docker run image %s\n' "${image_name}:${image_tag}"

    docker run \
        -d \
        --env DISPLAY="${DISPLAY}" \
        -v '/tmp/.X11-unix:/tmp/.X11-unix' \
        --mount type=bind,source="${mount_profile_source}",target="${mount_profile_target}" \
        --mount type=bind,source="${mount_workspace_source}",target="${mount_workspace_target}" \
        --name "${container_name}" \
        "${image_name}:${image_tag}"
}

_docker_start() {
    printf 'Docker start container %s\n' "${container_name}"

    docker start "${container_name}"
}

#===============================================================================
# Execution
#===============================================================================

if [ $# -eq 0 ]; then
    _die 'No arguments provided'
fi

case "${1}" in
    -h|--help)
        _print_help
        ;;
    build)
        _docker_build
        ;;
    run)
        _docker_run
        ;;
    start)
        _docker_start
        ;;
    *)
        _die "Unknown argument '${1}'"
        ;;
esac
