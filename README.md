# [GIMP](https://www.gimp.org/) Docker image
- based on Alpine Linux
- executable Docker container
- persistent application settings

## Prerequisites
### Mount directories
- **profile**: [GIMP profile](https://www.gimp.org/tutorials/GIMPProfile/) settings directory
- **workspace**: share files between host and containerized app

Mount directories must pre-exist on host system and should be writable by group with id `1000`. Execute this command in project root directory:
```bash
mkdir -p "${PWD}"/profile "${PWD}"/workspace \
&& chown -R $(id -u):1000 "${PWD}"/profile "${PWD}"/workspace \
&& chmod -R g+w "${PWD}"/profile "${PWD}"/workspace
```

## Run
Execute `run.sh` script.
