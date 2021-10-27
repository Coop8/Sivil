ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Sivil

Sivil_FILES = SivilController.m sivilTitleController.m SVLAnimatedNav.m SVLColorPickerCell.m SVLSwitchCell.m
Sivil_FRAMEWORKS = UIKit
Sivil_PRIVATE_FRAMEWORKS = Preferences
Sivil_INSTALL_PATH = /Library/PreferenceBundles
Sivil_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
