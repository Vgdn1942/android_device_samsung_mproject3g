#
# Copyright (C) 2012 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/mproject3g

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Init files
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/rootdir/init.smdk4x12.rc:root/init.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/sbin/cbd:root/sbin/cbd

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/silence.wav:system/etc/sound/silence.wav

# Camera FW
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/80cfw:system/etc/init.d/80cfw

# Netflix hack
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/98netflix:system/etc/init.d/98netflix

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# Packages
PRODUCT_PACKAGES := \
    AdvancedDisplay \
    audio.a2dp.default \
    audio.primary.smdk4x12 \
    audio.r_submix.default \
    audio.usb.default \
    com.android.future.usb.accessory \
    gralloc.exynos4 \
    hwcomposer.exynos4 \
    libfimg \
    libnetcmdiface \
    libsecion \
    libsync \
    macloader \
    tinymix

# MFC API
PRODUCT_PACKAGES += \
    libsecmfcdecapi \
    libsecmfcencapi

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libSEC_OMX_Resourcemanager \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.WMV.Decoder \
    libOMX.SEC.AVC.Encoder \
    libOMX.SEC.M4V.Encoder
#   libOMX.SEC.VP8.Decoder

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml
#    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
#    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Wi-fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=1 \
    ro.opengles.version=131072 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false

# Locale
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale.language=ru \
    ro.product.locale.region=RU \
    persist.sys.timezone=Europe/Minsk \
    ro.com.android.dateformat=dd-MM-yyyy

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Debug
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapminfree=2m

# Include exynos4 platform specific parts
TARGET_HAL_PATH := hardware/samsung/exynos4/hal
TARGET_OMX_PATH := hardware/samsung/exynos/multimedia/openmax
$(call inherit-product, hardware/samsung/exynos4x12.mk)

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Webviewchromium
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuild_chromium/libwebviewchromium.so:system/lib/libwebviewchromium.so \
    $(LOCAL_PATH)/prebuild_chromium/libchromium_net.so:system/lib/libchromium_net.so \
    $(LOCAL_PATH)/prebuild_chromium/libstagefright_chromium_http.so:system/lib/libstagefright_chromium_http.so
endif

# Resolution
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12 \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/lib/modules/commkm.ko:root/lib/modules/commkm.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/dhd.ko:root/lib/modules/dhd.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/mvpkm.ko:root/lib/modules/mvpkm.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/oektestkm.ko:root/lib/modules/oektestkm.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/pvtcpkm.ko:root/lib/modules/pvtcpkm.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/tiny_hw.xml:system/etc/sound/mproject3g

# Camera Wrapper
#PRODUCT_PACKAGES += \
#    camera.smdk4x12

# IRDA
PRODUCT_PACKAGES += \
    consumerir.exynos4

# Sensors
#PRODUCT_PACKAGES += \
#    sensorservice \
#    sensors.smdk4x12

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap \
    Stk \
    SamsungServiceMode

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungExynos4RIL \
    mobiledata.interfaces=rmnet0,pdp0,wlan0,gprs,ppp0 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

$(call inherit-product-if-exists, vendor/samsung/mproject3g/mproject3g-vendor.mk)
