Modifications

U-Boot
1. Change SPI Flash IDs to not enable quad spi
2. Set "#define CONFIG_SYS_MONITOR_LEN         (512 * 1024)" in include

=> sf probe
SF: Detected n25q128a13 with page size 256 Bytes, erase size 4 KiB, total 16 MiB
=> sf read 0x82000000 0xe0000 0x60000
device 0 offset 0xe0000, size 0x60000
SF: 393216 bytes @ 0xe0000 Read: OK
=> sf read 0x82000000 0xe0000 0x100000
device 0 offset 0xe0000, size 0x100000
SF: 1048576 bytes @ 0xe0000 Read: OK
=> sf read 0x82000000 0xe0000 0x600000
device 0 offset 0xe0000, size 0x600000

sf probe
sf read 0x82000000 0xe0000 0x600000
setenv bootargs console=ttyS0,115200n8
bootm 0x82000000
