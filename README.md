# Buildroot projects

## System prep

If you're using Ubuntu, you may need to install some packages to make Buildroot
work. This should be sufficient:

    $ sudo apt-get install git g++ libncurses5-dev bc make unzip zip

## Building

All builds are done in directories that are separate from the source tree. This
allows multiple configurations to be tried simultaneously and keeps the source
tree clean.

Assuming that you've cloned this project already, create a build directory by
running `./create-build.sh <defconfig> <path to build directory>`. To create
build directories for all configurations (which is what I do), run
`./create-all-builds.sh`

Then build the project that you want:

    $ cd o/fillmein
    $ make

It can take some time to download and build everything so you may need to be
patient. The build products can be found in the `images` directory.

# Applications

The following projects are available:

1. Raspberry Pi SDCard writer appliance ([README.md](board/rpi_sdburner/README.md))
2. Nerves firmware installer for [Vultr](https://www.vultr.com/)

