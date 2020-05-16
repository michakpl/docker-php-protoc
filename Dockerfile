FROM php:7.4-cli-alpine3.11

RUN set -ex && apk --update --no-cache add \
    bash \
    openssh-client \
    ca-certificates \
    make \
    cmake \
    autoconf \
    automake \
    curl \
    tar \
    libtool \
    g++ \
    git \
    openjdk8-jre \
    libstdc++ \
    ca-certificates \
    nss \
    linux-headers \
    unzip \
    composer

WORKDIR /tmp
RUN git clone https://github.com/protocolbuffers/protobuf.git && \
    cd protobuf && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    protoc --version

WORKDIR /tmp
RUN git clone https://github.com/allegro/php-protobuf && \
    cd php-protobuf && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    composer install
