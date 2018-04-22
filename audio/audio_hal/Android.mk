# Copyright 2011 The Android Open Source Project

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    audio_hw_hal.cpp \
    HardwarePinSwitching.c

ifeq ($(strip $(TARGET_HAS_QACT)),true)
LOCAL_SRC_FILES += \
    AudioHardware_cad.cpp
LOCAL_CFLAGS += -DWITH_QACT
else
LOCAL_SRC_FILES += \
    AudioHardware.cpp
endif

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_CFLAGS += -DWITH_A2DP
endif

ifeq ($(BOARD_HAVE_QCOM_FM),true)
  LOCAL_CFLAGS += -DWITH_QCOM_FM
  LOCAL_CFLAGS += -DQCOM_FM_ENABLED
endif

ifeq ($(call is-android-codename-in-list,ICECREAM_SANDWICH),true)
  LOCAL_CFLAGS += -DREG_KERNEL_UPDATE
endif

ifeq ($(strip $(BOARD_USES_SRS_TRUEMEDIA)),true)
LOCAL_CFLAGS += -DSRS_PROCESSING
endif

LOCAL_CFLAGS += -DQCOM_VOIP_ENABLED
LOCAL_CFLAGS += -DQCOM_TUNNEL_LPA_ENABLED

LOCAL_SHARED_LIBRARIES := \
    libcutils       \
    libutils        \
    libmedia

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_STATIC_LIBRARIES := \
    libmedia_helper \
    libaudiohw_legacy

LOCAL_MODULE := audio.primary.msm7x27a
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -fno-short-enums

LOCAL_C_INCLUDES := $(TARGET_OUT_HEADERS)/mm-audio/audio-alsa
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audcal
LOCAL_C_INCLUDES += hardware/libhardware/include
LOCAL_C_INCLUDES += hardware/libhardware_legacy/include
LOCAL_C_INCLUDES += frameworks/base/include
LOCAL_C_INCLUDES += system/core/include

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

include $(BUILD_SHARED_LIBRARY)
