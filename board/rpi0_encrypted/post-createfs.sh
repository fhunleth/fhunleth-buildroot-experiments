#!/usr/bin/env bash

set -e

TARGETDIR=$1
FWNAME=$2

if [[ -z $FWNAME ]]; then
    FWNAME=rpi0_encrypted-$(git -C $BR2_EXTERNAL_FHUNLETH_PATH describe --dirty)
fi

FWUP_CONFIG=$BR2_EXTERNAL_FHUNLETH_PATH/board/rpi0_encrypted/fwup.conf
FWUP=/usr/local/bin/fwup
#FWUP=$HOST_DIR/usr/bin/fwup

FW_PATH=$BINARIES_DIR/$FWNAME.fw

# Build the firmware image (.fw file)
echo "Creating $FWNAME.fw..."
$FWUP -c -f $FWUP_CONFIG -o $FW_PATH

