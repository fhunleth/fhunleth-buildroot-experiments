#!/usr/bin/env bash

set -e

# Copy the template .ipxe file over
cp $BR2_EXTERNAL_FHUNLETH_PATH/board/nerves_vultr_loader/*.ipxe $BINARIES_DIR

