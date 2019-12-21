FROM alpine:3

ARG DOCKER_TAG
ARG image_name
ARG user=${user:-$image_name}
ARG uid=${uid:-1000}
ARG group=${group:-$user}
ARG gid=${gid:-$uid}

RUN apk add --no-cache --update \
    gimp=~${DOCKER_TAG} \
    ttf-freefont \
    dbus-x11

RUN addgroup \
    --gid $gid \
    $group \
    && adduser \
    --uid $uid \
    --disabled-password \
    --ingroup $group \
    $user

USER $user_name

WORKDIR /home/$user_name/workspace

ENTRYPOINT ["/usr/bin/gimp"]
