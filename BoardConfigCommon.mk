# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# BoardConfig.mk
#

## Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

## Platform
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_LOWMEM := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm7x27a-common/include
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp

## Kernel
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01300000
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27a

## FM Radio
#BOARD_HAVE_QCOM_FM := true

## Memory
TARGET_USES_ION := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true

## Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS -DSAMSUNG_CAMERA_LEGACY

## Qcom hardwae
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

## Video
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_MMPARSER

## Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DNO_TUNNELED_SOURCE
TARGET_HAS_QACT := true

## EGL, graphics
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_DOESNT_USE_FENCE_SYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/samsung/msm7x27a-common/prebuilt/lib/egl/egl.cfg

## Qualcomm BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

## GPS
QCOM_GPS_PATH := device/samsung/msm7x27a-common/gps
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true

## Bluetooth
BOARD_HAVE_BLUETOOTH := true

## Wi-Fi
BOARD_WLAN_DEVICE := ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_AP_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"

## RIL
BOARD_USES_LEGACY_RIL := true
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RIL_REFERENCE := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/msm7x27a-common/ril/
COMMON_GLOBAL_CFLAGS += -DRIL_SUPPORTS_SEEK
COMMON_GLOBAL_CFLAGS += -DRIL_VARIANT_LEGACY

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_LPM_BOOT_ARGUMENT_NAME := androidboot.bootchg
BOARD_LPM_BOOT_ARGUMENT_VALUE := true

## Use device specific modules
TARGET_PROVIDES_LIBLIGHTS := true

## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a

# Misc.
TARGET_SYSTEM_PROP := device/samsung/msm7x27a-common/system.prop

# Webview

PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

## Recovery
TARGET_RECOVERY_FSTAB := device/samsung/msm7x27a-common/rootdir/fstab.qcom
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/msm7x27a-common/rootdir/graphics/graphics.c ../../../device/samsung/msm7x27a-common/rootdir/graphics/graphics_overlay.c
## Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 979369984
