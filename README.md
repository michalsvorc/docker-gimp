# [GIMP](https://www.gimp.org/) docker image
- based on Alpine Linux
- docker container executable

## Image tags
See [list of available tags](https://hub.docker.com/repository/docker/michalsvorc/gimp/tags).

## Pull
Docker Hub image
```sh
docker pull michalsvorc/gimp:<image_tag>
```

## Run
```sh
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=<local_workspace>,target=<container_workspace> \
    --mount type=bind,source=<local_profile>,target=<container_profile> \
    --name michalsvorc-gimp-rm \
    michalsvorc/gimp:<image_tag>
```

### Bind mounts
Optional mount directories to for communication between local machine and docker container.
- **workspace**: import local images to GIMP and save your work.
- **profile**: import fonts, brushes and plugins to [GIMP profile directory](https://www.gimp.org/tutorials/GIMPProfile/). Corresponds to `/home/gimp/.config/GIMP/<DOCKER_TAG>` container path.

## Run helper script
Execute `./run.sh` helper script to use predefined bind mounts (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).
