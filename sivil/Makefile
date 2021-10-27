ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_DEVICE_IP = 10.192.4.46

export SDKVERSION=14.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Sivil
Sivil_FILES = Tweak.x
Sivil_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += Sivilprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
