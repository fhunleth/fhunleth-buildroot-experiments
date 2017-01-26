################################################################################
#
# fbtft_tools
#
################################################################################

FBTFT_TOOLS_VERSION = e317d90ae0b2a8b5dc04b20202a2149025dd5726
FBTFT_TOOLS_SITE = $(call github,notro,fbtft_tools,$(FBTFT_TOOLS_VERSION))
FBTFT_TOOLS_LICENSE = GPLv2+
FBTFT_TOOLS_LICENSE_FILES = COPYING

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_ADS7846_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += ads7846_device
endif

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_GPIO_BACKLIGHT_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += gpio_backlight_device
endif

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_GPIO_KEYS_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += gpio_keys_device
endif

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_GPIO_MOUSE_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += gpio_mouse_device
endif

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_RPI_POWER_SWITCH_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += rpi_power_switch
endif

ifeq ($(BR2_PACKAGE_FBTFT_TOOLS_STMPE_DEVICE),y)
FBTFT_TOOLS_MODULE_SUBDIRS += stmpe_device
endif

$(eval $(kernel-module))
$(eval $(generic-package))
