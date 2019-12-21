FROM alpine:3

ARG gimp_version
ARG user=gimp
ARG uid=1000
ARG group=$user
ARG gid=$uid

RUN apk add --no-cache --update \
    gimp=~${gimp_version} \
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

USER $user

WORKDIR /home/$user/workspace

ENTRYPOINT ["/usr/bin/gimp"]
