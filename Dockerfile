
FROM ubuntu:xenial

MAINTAINER ljatsh@test.com

ARG LUAROCKS_VERSION="3.0.0"

RUN apt-get update \
    && apt-get install -y curl unzip make libreadline-dev autoconf gcc-4.8 g++-4.8 gdb vim \
    && ln -s /usr/bin/gcc-4.8 /usr/bin/gcc \
    && ln -s /usr/bin/g++-4.8 /usr/bin/g++

RUN apt-get install -y libncurses-dev

# install cmake
RUN cd /tmp \
    && curl -fSL https://cmake.org/files/v2.8/cmake-2.8.0.tar.gz -o cmake-2.8.0.tar.gz --progress \
    && tar xvzf cmake-2.8.0.tar.gz \
    && cd cmake-2.8.0 \
    && ./bootstrap --prefix=/usr -- -DCMAKE_BUILD_TYPE:STRING=Release \
    && make install

# install lua
RUN cd /tmp \
    && curl -fSL http://www.lua.org/ftp/lua-5.1.5.tar.gz -o lua-5.1.5.tar.gz --progress \
    && tar xzf lua-5.1.5.tar.gz \
    && cd lua-5.1.5 \
    && make linux test \
    && make install

# install luarocks
RUN cd /tmp \
    && curl -fSL https://github.com/luarocks/luarocks/archive/${LUAROCKS_VERSION}.tar.gz -o luarocks-${LUAROCKS_VERSION}.tar.gz --progress \
    && tar xzf luarocks-${LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${LUAROCKS_VERSION} \
    && ./configure \
    && make build \
    && make install

# install busted
RUN luarocks install busted

RUN apt-get install -y git libtool \
    && ln -s /usr/bin/libtoolize /usr/bin/libtool \
    && ln -s /usr/bin/gcc /usr/bin/cc

RUN apt-get autoremove -y \
    && rm -fr /tmp/*

CMD ["/bin/bash"]
