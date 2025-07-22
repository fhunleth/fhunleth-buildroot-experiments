#!/bin/sh

KERNEL=images/Image
TEST_STORAGE=images/test_storage.img
HOSTSHARE=$PWD/hostshare

rm -f $TEST_STORAGE
fallocate -l 100m $TEST_STORAGE

qemu-system-aarch64 \
    -M virt -cpu cortex-a53 -nographic -smp 1 -kernel $KERNEL -append "console=ttyAMA0" \
    -netdev user,id=eth0 \
    -device virtio-net-device,netdev=eth0 \
    -drive file=$TEST_STORAGE,if=none,format=raw,id=hd0 \
    -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd0,bus=scsi.0 \
    -virtfs local,path=$HOSTSHARE,mount_tag=hostshare,security_model=none,id=hostshare \

