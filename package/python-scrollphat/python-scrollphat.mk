################################################################################
#
# python-scrollphat
#
################################################################################

PYTHON_SCROLLPHAT_VERSION = 0.0.7
PYTHON_SCROLLPHAT_SOURCE = scrollphat-$(PYTHON_SCROLLPHAT_VERSION).tar.gz
PYTHON_SCROLLPHAT_SITE = https://pypi.python.org/packages/80/80/77620b6e412cdd30f9f624a50164d3f2be6ad5ba5c2194f4c7493787a6df
PYTHON_SCROLLPHAT_LICENSE = MIT
PYTHON_SCROLLPHAT_LICENSE_FILES = LICENCE.txt
PYTHON_SCROLLPHAT_SETUP_TYPE = distutils
PYTHON_SCROLLPHAT_DEPENDENCIES = python-smbus-cffi

$(eval $(python-package))
