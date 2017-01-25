# Include custom packages
include $(sort $(wildcard $(BR2_EXTERNAL_RPI_PATH)/package/*/*.mk))

FW_FILE=$(firstword $(wildcard $(BINARIES_DIR)/*.fw))

# Replace everything on the SDCard with new bits
burn:
	@FW_FILE=`ls -t $(BINARIES_DIR)/*.fw | head -1`; \
	if [ -e "$${FW_FILE}" ]; then \
		echo "Burning $${FW_FILE}..."; \
		sudo $(HOST_DIR)/usr/bin/fwup $${FW_FILE}; \
	else \
		echo "ERROR: No firmware found. Check that 'make' completed successfully"; \
		echo "and that a firmware (.fw) file is in $(BINARIES_DIR)."; \
	fi

help: rpi-help

rpi-help:
	@echo "RPi Experiments Help"
	@echo "--------------------"
	@echo
	@echo "This build directory is configured to create the system described in:"
	@echo
	@echo "$(BR2_DEFCONFIG)"
	@echo
	@echo "Building:"
	@echo "  all                           - Build the current configuration"
	@echo "  burn                          - Burn the most recent build to an SDCard"
	@echo "                                  (invokes sudo)"
	@echo "  clean                         - Clean everything"
	@echo
	@echo "Configuration:"
	@echo "  menuconfig                    - Run Buildroot's menuconfig"
	@echo "  linux-menuconfig              - Run menuconfig on the Linux kernel"
	@echo "  busybox-menuconfig            - Run menuconfig on Busybox to enable shell"
	@echo "                                  commands and more"
	@echo
	@echo "---------------------------------------------------------------------------"
	@echo
	@echo "Buildroot Help"
	@echo "--------------"

.PHONY: burn rpi-help
