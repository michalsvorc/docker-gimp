# [GIMP](https://www.gimp.org/) Docker image
- based on Alpine Linux
- executable Docker container

## Pull
```bash
docker pull michalsvorc/gimp
```
[List of Docker tags](https://hub.docker.com/repository/docker/michalsvorc/gimp/tags)

## Run
```bash
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --mount type=bind,source=<host_workspace-directory>,target=<container_workspace-directory> \
    --mount type=bind,source=<host_profile-directory>,target=<container_profile-directory> \
    --name michalsvorc-gimp-rm \
    michalsvorc/gimp
```

### Mount directories
- **workspace**: open host files in GIMP and save GIMP work.
- **profile**: store fonts, brushes and plugins in shared [GIMP profile directory](https://www.gimp.org/tutorials/GIMPProfile/). Corresponds to `/home/gimp/.config/GIMP/<GIMP_VERSION>` container path.

### Run helper script
Execute `./run.sh` helper script to use predefined mount directories (requires [Xhost](https://jlk.fjfi.cvut.cz/arch/manpages/man/xhost.1)).

Example:
```bash
./run.sh
```

## FAQ

### ERROR: unable to open for writing: [Errno 13] Permission denied
Mount directories should pre-exist on host system and should be writable by group with gid `1000`.

to make directory writable by gid `1000` run:
```bash
chown -R $(id -u):1000 <directory>
chmod -R g+w <directory>
```
