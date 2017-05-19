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

DEVICE_PACKAGE_OVERLAYS += device/samsung/msm7x27a-common/overlay

## Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

## Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a

## Misc.
PRODUCT_PACKAGES += \
    DeviceParts \
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
    power.msm7x27a

## FM radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2

## Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

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
    device/samsung/msm7x27a-common/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/msm7x27a-common/configs/etc/media_codecs.xml:system/etc/media_codecs.xml

## Rootdir
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/samsung/msm7x27a-common/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/msm7x27a-common/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/samsung/msm7x27a-common/rootdir/lpm.rc:root/lpm.rc \
    device/samsung/msm7x27a-common/rootdir/fstab.qcom:root/fstab.qcom

## FM
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh

## Network
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/msm7x27a-common/configs/bin/get_macaddrs:system/bin/get_macaddrs

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/vold.fstab:system/etc/vold.fstab

## Bluetooth config
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/samsung/msm7x27a-common/configs/etc/PSConfig_7820.psr:system/etc/PSConfig_7820.psr

## Audio
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/msm7x27a-common/configs/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/msm7x27a-common/configs/etc/AudioFilter.csv:system/etc/AudioFilter.csv

## Sensor calibration files
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/calib.dat:system/etc/calib.dat \
    device/samsung/msm7x27a-common/configs/etc/param.dat:system/etc/param.dat \
    device/samsung/msm7x27a-common/configs/etc/sensors.dat:system/etc/sensors.dat
## init.d
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27a-common/configs/etc/init.d/70rild:system/etc/init.d/70rild \
    device/samsung/msm7x27a-common/configs/etc/init.d/90logcat:system/etc/init.d/90logcat \

#Rild
PRODUCT_PACKAGES += \
	rild2

## Other
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, vendor/samsung/msm7x27a-common/msm7x27a-common-vendor.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
