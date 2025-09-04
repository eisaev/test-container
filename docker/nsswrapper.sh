#!/usr/bin/env sh

if [ "$USER_ID" != "0" ]; then

    NSS_WRAPPER_PASSWD="/tmp/passwd"
    cat /etc/passwd > $NSS_WRAPPER_PASSWD
    echo "default:x:$(id -u):$(id -g)::${HOME}:/bin/bash" >> $NSS_WRAPPER_PASSWD

    export NSS_WRAPPER_PASSWD
    export NSS_WRAPPER_GROUP="/etc/group"

    export LD_PRELOAD=libnss_wrapper.so
fi

exec "$@"
