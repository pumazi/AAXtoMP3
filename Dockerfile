FROM debian:sid-slim

COPY ./ /code

RUN set -e && \
    cd /tmp && \
    echo "deb http://www.deb-multimedia.org sid main non-free" > /etc/apt/sources.list.d/multimedia.list && \
    apt-get update -oAcquire::AllowInsecureRepositories=true && \
    apt-get install -y --allow-unauthenticated deb-multimedia-keyring && \
    apt-get update && \
    apt-get install -y bc ffmpeg mp4v2-utils && \
    rm -rf /var/lib/apt/lists/*
