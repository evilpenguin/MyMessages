export THEOS_DEVICE_IP = 192.168.0.4
#export THEOS_DEVICE_PORT = 2222
export ARCHS = armv7 arm64
export SDKVERSION = 9.3
export TARGET = iphone:latest

include ../theos/makefiles/common.mk

TWEAK_NAME = MyMessages
$(TWEAK_NAME)_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
