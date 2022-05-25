FROM ubuntu:20.04

ARG VERSION

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install --yes --no-install-recommends \
       # Required do download the installer
       wget \
       ca-certificates \
       # Required for installer
       libc6:i386 \
       # Required for the compiler
       libtinfo5 \
       libncurses5 \
       libpython2.7 \
       zlib1g \
       # Required for rl78-elf-objcopy
       zlib1g:i386 \
       # Build tools
       make \
       git \
       srecord \
    && wget "https://llvm-gcc-renesas.com/downloads/download.php?f=rl78/${VERSION}/llvm-${VERSION}-rl78-elf.run" -O /tmp/installer.run \
    && chmod +x /tmp/installer.run \
    && /tmp/installer.run -p /opt/rl78-elf-llvm -y \
    && mkdir /src \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=${PATH}:/opt/rl78-elf-llvm/bin

VOLUME /src
WORKDIR /src
