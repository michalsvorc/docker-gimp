FROM alpine:latest

ARG DOCKER_TAG
ARG user_name=gimp

RUN apk add --no-cache --update \
    gimp=~${DOCKER_TAG} \
    ghostscript-fonts \
    dbus-x11 \
    && adduser -D -u 1000 $user_name

USER $user_name
WORKDIR /home/$user_name/workspace

ENTRYPOINT ["/usr/bin/gimp"]
