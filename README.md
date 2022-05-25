# About

This is a docker image with LLVM toolchain for Renesas RL78 microcontrollers.

The toolchain is from https://llvm-gcc-renesas.com/rl78/rl78-download-toolchains/

# Usage

Build a project using make:
```
docker run --rm -v "$(pwd):/src" msalau/rl78-elf-llvm make
```
Run the image in interactive mode:
```
docker run --rm -v "$(pwd):/src" -it msalau/rl78-elf-llvm
```

The version of the toolchain may be specified explicitly. E.g.:
```
docker run --rm -v "$(pwd):/src" -it msalau/rl78-elf-llvm:10.0.0.202203
```

# Details
The image is based on Ubuntu 20.04 x86_64.

Tools pre-installed in the image:
* wget
* make
* git
* srecord
* rl78-elf-llvm

The toolchain is installed into `/opt/rl78-elf-llvm` and is added to `PATH`.
There is no host LLVM in the image.
