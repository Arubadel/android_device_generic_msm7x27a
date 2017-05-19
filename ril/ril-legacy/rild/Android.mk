LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	rild.c


LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libril \
	libdl

LOCAL_CFLAGS := -DRIL_SHLIB

LOCAL_MODULE:= rild2
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
