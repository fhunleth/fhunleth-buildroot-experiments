#!/usr/bin/env bash

set -e

TARGETDIR=$1
FWNAME=$2

if [[ -z $FWNAME ]]; then
    FWNAME=rpi_sdburner-$(git -C $BR2_EXTERNAL_RPI_PATH describe --dirty)
fi

# Mark the Raspberry Pi kernel image as using device tree
$HOST_DIR/usr/bin/mkknlimg \
    $BINARIES_DIR/zImage $BINARIES_DIR/zImage.mkknlimg

FWUP_CONFIG=$BR2_EXTERNAL_RPI_PATH/board/rpi_sdburner/fwup.conf
FWUP=$HOST_DIR/usr/bin/fwup

FW_PATH=$BINARIES_DIR/$FWNAME.fw

# Build the firmware image (.fw file)
echo "Creating $FWNAME.fw..."
$FWUP -c -f $FWUP_CONFIG -o $FW_PATH

