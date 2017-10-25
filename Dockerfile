FROM php:7.1-alpine

ARG NODE_VERSION=8.7.0

LABEL description="Base image for with PHP 7.1, Node.JS, on Alpine Linux" \
    version="1.0" \
    maintainer="lucas@lovethebomb.eu" \
    NODE_VERSION=$NODE_VERSION

RUN apk add --no-cache --virtual .persistent-deps \
    binutils-gold \
    libstdc++

RUN apk add --no-cache --virtual .build-deps \
    python \
    linux-headers \
    coreutils \
    g++ \
    gcc \
    libgcc \
    make \
    gnupg

RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    56730D5401028683275BD23C23EFEFE93C4CFFFE \
    && curl -sSLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" \
    && curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" | gpg --batch --decrypt | grep " node-v$NODE_VERSION.tar.xz\$" | sha256sum -c | grep . \
    && tar -xf "node-v$NODE_VERSION.tar.xz" \
    && cd "node-v$NODE_VERSION" \
    && ./configure \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && apk del .build-deps \
    && rm -Rf "node-v$NODE_VERSION"

CMD [ "node" ]