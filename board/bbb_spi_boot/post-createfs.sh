#!/usr/bin/env bash

set -e

TARGETDIR=$1
FWNAME=$2

if [[ -z $FWNAME ]]; then
    #FWNAME=bbb_spi_boot-$(git -C $BR2_EXTERNAL_FHUNLETH_PATH describe --dirty)
    FWNAME=bbb_spi_boot
fi

FWUP_CONFIG=$BR2_EXTERNAL_FHUNLETH_PATH/board/bbb_spi_boot/fwup.conf
FWUP=$HOST_DIR/usr/bin/fwup

FW_PATH=$BINARIES_DIR/$FWNAME.fw
IMG_PATH=$BINARIES_DIR/$FWNAME.img
HEX_PATH=$BINARIES_DIR/$FWNAME.hex
UBOOT_HEX_PATH=$BINARIES_DIR/$FWNAME-uboot.hex

# Avoid accidentally using old files
rm -f $FW_PATH $IMG_PATH $HEX_PATH

# Build the firmware image (.fw file)
echo "Creating $FWNAME.fw..."
$FWUP -c -f $FWUP_CONFIG -o $FW_PATH
$FWUP -a -i $FW_PATH -d $IMG_PATH -t complete

# Swap bytes for the SPI Flash programmer to account for the AM3358 reading
# them in 32-bit little endian
#srec_cat $IMG_PATH -binary -byte-swap 4 -o $HEX_PATH -intel
srec_cat $IMG_PATH -binary -o $HEX_PATH -intel


dd if=$IMG_PATH of=$IMG_PATH.uboot count=1280
srec_cat $IMG_PATH.uboot -binary -o $UBOOT_HEX_PATH -intel

