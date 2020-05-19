FROM php:7.4-cli-alpine3.11

WORKDIR /tmp
RUN set -ex && apk --update --no-cache add \
    bash \
    make \
    cmake \
    autoconf \
    automake \
    curl \
    tar \
    libtool \
    g++ \
    git \
    libstdc++ \
    ca-certificates \
    nss \
    linux-headers \
    composer && \
    git clone https://github.com/protocolbuffers/protobuf.git && \
    cd protobuf && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    protoc --version && \
    pecl install protobuf && \
    docker-php-ext-enable protobuf && \
    cd .. && \
    rm -R protobuf && \
    git clone https://github.com/allegro/php-protobuf && \
    cd php-protobuf && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    composer install && \
    mv /tmp/php-protobuf /php-protobuf

COPY ./cli/entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /defs
ENTRYPOINT ["/entrypoint.sh"]
