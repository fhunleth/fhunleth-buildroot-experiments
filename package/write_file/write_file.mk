################################################################################
#
# write_file
#
################################################################################

define WRITE_FILE_EXTRACT_CMDS
	cp $(BR2_EXTERNAL_FHUNLETH_PATH)/package/write_file/write_file.c $(@D)/
endef

define WRITE_FILE_BUILD_CMDS
	(cd $(@D); $(TARGET_CC) -Wall -Os -s write_file.c -o write_file)
endef

define WRITE_FILE_INSTALL_TARGET_CMDS
	install -m 0755 -D $(@D)/write_file $(TARGET_DIR)/usr/bin/write_file
endef

$(eval $(generic-package))
