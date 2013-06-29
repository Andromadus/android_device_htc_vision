#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

#Andromadus Vendor include

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/vision/configs/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/vision/ramdisk/init.vision.rc:root/init.vision.rc \
    device/htc/vision/ramdisk/ueventd.vision.rc:root/ueventd.vision.rc \
    device/htc/vision/ramdisk/fstab.vision:root/fstab.vision

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/vision/device-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    ro.kernel.android.checkjni=0

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/vision/overlay

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/vision/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Sensors, GPS, Lights, Power
PRODUCT_PACKAGES += \
    gps.vision \
    lights.vision \
    sensors.vision

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/vision/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/vision/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/vision/keylayout/vision-keypad-ara.kl:system/usr/keylayout/vision-keypad-ara.kl \
    device/htc/vision/keylayout/vision-keypad-ell.kl:system/usr/keylayout/vision-keypad-ell.kl \
    device/htc/vision/keylayout/vision-keypad-esn.kl:system/usr/keylayout/vision-keypad-esn.kl \
    device/htc/vision/keylayout/vision-keypad-fra.kl:system/usr/keylayout/vision-keypad-fra.kl \
    device/htc/vision/keylayout/vision-keypad-ger.kl:system/usr/keylayout/vision-keypad-ger.kl \
    device/htc/vision/keylayout/vision-keypad-hk.kl:system/usr/keylayout/vision-keypad-hk.kl \
    device/htc/vision/keylayout/vision-keypad-ita.kl:system/usr/keylayout/vision-keypad-ita.kl \
    device/htc/vision/keylayout/vision-keypad.kl:system/usr/keylayout/vision-keypad.kl \
    device/htc/vision/keylayout/vision-keypad-nor.kl:system/usr/keylayout/vision-keypad-nor.kl \
    device/htc/vision/keylayout/vision-keypad-rus.kl:system/usr/keylayout/vision-keypad-rus.kl \
    device/htc/vision/keylayout/vision-keypad-sea.kl:system/usr/keylayout/vision-keypad-sea.kl \
    device/htc/vision/keylayout/vision-keypad-tur.kl:system/usr/keylayout/vision-keypad-tur.kl \
    device/htc/vision/keylayout/vision-keypad-wwe.kl:system/usr/keylayout/vision-keypad-wwe.kl \
    device/htc/vision/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/vision/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keymaps
PRODUCT_COPY_FILES += \
    device/htc/vision/keychars/vision-keypad-ara.kcm:system/usr/keychars/vision-keypad-ara.kcm \
    device/htc/vision/keychars/vision-keypad-ell.kcm:system/usr/keychars/vision-keypad-ell.kcm \
    device/htc/vision/keychars/vision-keypad-esn.kcm:system/usr/keychars/vision-keypad-esn.kcm \
    device/htc/vision/keychars/vision-keypad-fra.kcm:system/usr/keychars/vision-keypad-fra.kcm \
    device/htc/vision/keychars/vision-keypad-ger.kcm:system/usr/keychars/vision-keypad-ger.kcm \
    device/htc/vision/keychars/vision-keypad-hk.kcm:system/usr/keychars/vision-keypad-hk.kcm \
    device/htc/vision/keychars/vision-keypad-ita.kcm:system/usr/keychars/vision-keypad-ita.kcm \
    device/htc/vision/keychars/vision-keypad.kcm:system/usr/keychars/vision-keypad.kcm \
    device/htc/vision/keychars/vision-keypad-nor.kcm:system/usr/keychars/vision-keypad-nor.kcm \
    device/htc/vision/keychars/vision-keypad-rus.kcm:system/usr/keychars/vision-keypad-rus.kcm \
    device/htc/vision/keychars/vision-keypad-sea.kcm:system/usr/keychars/vision-keypad-sea.kcm \
    device/htc/vision/keychars/vision-keypad-tur.kcm:system/usr/keychars/vision-keypad-tur.kcm \
    device/htc/vision/keychars/vision-keypad-wwe.kcm:system/usr/keychars/vision-keypad-wwe.kcm 

# Device specific firmware
PRODUCT_COPY_FILES += \
    device/htc/vision/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/vision/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/vision/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/vision/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb \
    device/htc/vision/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/vision/firmware/Vision_SPK.acdb:system/etc/firmware/Vision_SPK.acdb 

# Alternate NAM gps.conf to NAM package
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/nam/gps.conf

# Copy bcm4329 firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

PRODUCT_COPY_FILES += \
    device/htc/vision/configs/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/msm7x30-common/msm7230/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
PRODUCT_COPY_FILES += \
    device/htc/msm7x30-common/msm7230/bcmdhd.ko:system/lib/modules/bcmdhd.ko
endif

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# htc audio settings
$(call inherit-product, device/htc/vision/media_htcaudio.mk)
$(call inherit-product, device/htc/vision/media_a1026.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# we have enough storage space to hold precise GC data (dalvik.vm.dexopt-flags=m=y)
PRODUCT_TAGS += dalvik.gc.type-precise

# lower the increment
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.heapgrowthlimit=36m

$(call inherit-product-if-exists, vendor/htc/vision/device-vendor.mk)
