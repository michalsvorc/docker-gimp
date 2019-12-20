FROM alpine:latest

ARG DOCKER_TAG
ARG app_name
ARG user_name=${user_name:-$app_name}
ARG user_id=${user_id:-1000}
ARG group_name=${group_name:-$user_name}
ARG group_id=${group_id:-$user_id}

RUN apk add --no-cache --update \
    ghostscript-fonts \
    dbus-x11 \
    gimp=~${DOCKER_TAG}

RUN addgroup \
    --gid $group_id \
    $group_name \
    && adduser \
    -u $user_id \
    --disabled-password \
    --no-create-home \
    --ingroup $group_name \
    $user_name

USER $user_name

WORKDIR /home/$user_name/workspace

ENTRYPOINT ["/usr/bin/gimp"]
