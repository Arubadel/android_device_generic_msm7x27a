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

LOCAL_PATH := device/generic/msm7x27a

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

## Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

## Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer

# EGL
PRODUCT_PACKAGES += libstlport

## Misc.
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    com.android.future.usb.accessory

## Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.conf \
    libaudioutils

## Other HALs
PRODUCT_PACKAGES += \
    camera.msm7x27a \
    lights.msm7x27a \
    gps.msm7x27a \
    power.msm7x27a \
    libhealthd.msm7x27a \
    libxml2

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth-headers \
    hciconfig \
    hciattach \
    btmon \
    btproxy \
    bluetoothd-snoop \
    btmgmt \
    hcitool \
    l2ping \
    libsbc \
    avinfo \
    bccmd \
    haltest \
    libdbus \
    audio.sco.default \
    bluetoothd

## FM radio
#PRODUCT_PACKAGES += \
#    qcom.fmradio \
#    libqcomfm_jni \
#    FM2

## Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

## Prebuilt Webview
PRODUCT_PACKAGES += \
	libwebviewchromium

## Device Custom Settings
PRODUCT_PACKAGES += \
	DeviceParts

# WIFI
PRODUCT_PACKAGES += libcnefeatureconfig
PRODUCT_PACKAGES += libwpa_client
PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += dhcpcd.conf
PRODUCT_PACKAGES += wpa_supplicant
PRODUCT_PACKAGES += wpa_supplicant.conf

## Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

## Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

## Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \

## FM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh

#Rild
PRODUCT_PACKAGES += \
	rild2

## Network
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv

## Keychar
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/keychars/7x27a_kp.kcm.bin:system/usr/keychars/7x27a_kp.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \

## Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

## Sensor calibration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/calib.dat:system/etc/calib.dat \
    $(LOCAL_PATH)/prebuilt/etc/param.dat:system/etc/param.dat \
    $(LOCAL_PATH)/prebuilt/etc/sensors.dat:system/etc/sensors.dat

# OTA scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/releasetools/run_scripts.sh:install/bin/run_scripts.sh

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, vendor/generic/msm7x27a/msm7x27a-vendor.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, device/qcom/sepolicy/sepolicy.mk)

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk
include frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk

## Other
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
