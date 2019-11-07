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
    -v <workspace_local_path>:/home/gimp/<workspace_container_path> \
    -v <gimp_profile_local_path>:/home/gimp/<gimp_profile_container_path> \
    --name michalsvorc-gimp-rm \
    michalsvorc/gimp:<image_tag>
```

### Bind mounts
- **Workspace**: directory to import/export GIMP work between host machine and docker container.
- **GIMP profile**: [profile directory](https://www.gimp.org/tutorials/GIMPProfile/) to persist user settings or to import fonts, brushes and plugins.

## Run helper script
Execute `./run.sh` helper script to use predefined bind mount paths under projects `./mount/` directory (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).