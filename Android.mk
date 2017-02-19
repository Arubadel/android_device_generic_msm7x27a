LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),delos3geur)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
