# [GIMP](https://www.gimp.org/) Docker image
- based on Alpine Linux
- executable Docker container

## Pull
```bash
docker pull michalsvorc/gimp:<DOCKER_TAG>
```
See [Docker Hub repository](https://hub.docker.com/repository/docker/michalsvorc/gimp/tags) for list of all available DOCKER_TAGs.

## Run
```bash
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=<host_workspace-directory>,target=<container_workspace-directory> \
    --mount type=bind,source=<host_profile-directory>,target=<container_profile-directory> \
    --name michalsvorc-gimp-rm \
    michalsvorc/gimp:<DOCKER_TAG>
```

### Mount directories
- **workspace**: open host files in GIMP and save GIMP work.
- **profile**: store fonts, brushes and plugins in shared [GIMP profile directory](https://www.gimp.org/tutorials/GIMPProfile/). Corresponds to `/home/gimp/.config/GIMP/<DOCKER_TAG>` container path.

### Run helper script
Execute `./run.sh` helper script to use predefined mount directories (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).

Provide Docker tag as an optional argument to run specific version of application. Defaults to the most recent version when not provided.

Example:
```bash
./run.sh X.Y
```

## FAQ

### ERROR: unable to open for writing: [Errno 13] Permission denied
Mount directories should pre-exist on host system and should be writable by group with `gid=1000`.

Run `chown $(id -u):1000 <directory>` and `chmod g+w -R <directory>` to make directory writable by `gid=1000`.