QCOM_MEDIA_ROOT := $(call my-dir)
ifneq ($(filter delos3geur,$(TARGET_DEVICE)),)
include $(QCOM_MEDIA_ROOT)/libI420colorconvert/Android.mk
endif
