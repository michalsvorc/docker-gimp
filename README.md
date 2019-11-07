# [GIMP](https://www.gimp.org/) docker image
- based on Alpine Linux
- docker container executable

## Pull
Docker Hub image
```sh
docker pull michalsvorc/gimp
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

[List of available image tags](https://hub.docker.com/repository/docker/michalsvorc/gimp/tags)

## Bind mounts

### Workspace
Directory to import/export GIMP work between host machine and docker container.

### GIMP profile
[GIMP profile](https://www.gimp.org/tutorials/GIMPProfile/) directory to persist user settings or to import fonts, brushes and plugins.

### run.sh
Execute `./run.sh` helper script to use default bind volumes under `./mount/` directory (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).