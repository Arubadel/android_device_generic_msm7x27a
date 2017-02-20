LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),delos3geur)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
