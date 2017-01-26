# Raspberry Pi Experiments Buildroot

## System prep

If you're using Ubuntu, you may need to install some packages to make Buildroot
work. This should be sufficient:

    $ sudo apt-get install git g++ libncurses5-dev bc make unzip zip

## Building

All builds are done in directories that are separate from the source tree. This
allows multiple configurations to be tried simultaneously and keeps the source
tree clean.

Assuming that you've cloned this project already, create a build directory by
running `./create_build.sh <defconfig> <path to build directory>`. Here's an
example invocation:

    $ ./create_build.sh configs/fillmein_defconfig o/fillmein

Then build the firmware:

    $ cd o/fillmein
    $ make

It can take some time to download and build everything so you may need to be
patient. The build products can be found in the `images` directory.

# Applications

## SDBurner

This is a simple Raspberry Pi+PiTFT hat+Card Reader device that makes
programming SDCards really easy. One would have thought that installing software
on a laptop to program SDCards would not be hard, but it turns out to be brutal
when kids borrow laptops from parents, friends, etc. Some businesses lock down USB ports,
some parents have impossibly old laptops, and sometimes no one knows the admin
password. Well, no more. This little device reprograms Raspberry Pi MicroSD
cards in no time at all.

### Interim notes

    QT_QPA_EVDEV_KEYBOARD_PARAMETERS=/dev/input/event0 sdburner -platform linuxfb:fb=/dev/fb1

