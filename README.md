# [GIMP](https://www.gimp.org/) Docker image
- based on Alpine Linux
- executable Docker container

## Pull
```bash
docker pull michalsvorc/gimp:<DOCKER_TAG>
```
For list of available DOCKER_TAGs see [Docker Hub repository](https://hub.docker.com/repository/docker/michalsvorc/gimp/tags).

## Run
```bash
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=<local_workspace>,target=<container_workspace> \
    --mount type=bind,source=<local_profile>,target=<container_profile> \
    --name michalsvorc-gimp-rm \
    michalsvorc/gimp:<DOCKER_TAG>
```

### Bind mounts
Optional mount directories to for communication between local machine and Docker container.
- **workspace**: import local files to GIMP and save GIMP outputs.
- **profile**: import fonts, brushes and plugins to [GIMP profile directory](https://www.gimp.org/tutorials/GIMPProfile/). Corresponds to `/home/gimp/.config/GIMP/<DOCKER_TAG>` container path.

## Run helper script
Execute `./run.sh` helper script to use predefined bind mounts (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).

Provide Docker tag as an optional argument to run specific tagged image. Defaults to most recent tag when not provided.

Example:
```bash
./run.sh X.Y
```