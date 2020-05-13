# [GIMP](https://www.gimp.org/) Docker image

- based on Alpine Linux
- executable Docker image
- persistent application settings
- edge APK repository

### Mount directories

- **profile**: GIMP [profile](https://www.gimp.org/tutorials/GIMPProfile/) directory
- **workspace**: share files between the host and containerized app

## Run
Execute `run.sh` script.

## Troubleshooting

### Write access to mounted directories

Mount directories must be writable by group with id `1000`. Execute these commands in project root directory:

```bash
chown -R $(id -u):1000 "${PWD}"/profile "${PWD}"/workspace
chmod -R g+w "${PWD}"/profile "${PWD}"/workspace
```
