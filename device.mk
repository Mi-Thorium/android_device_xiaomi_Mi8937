#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    CustomROMsOverlay_Mi8937 \
    xiaomi_prada_overlay \
    xiaomi_prada_overlay_Settings \
    xiaomi_rolex_overlay \
    xiaomi_riva_overlay \
    xiaomi_ugg_overlay \
    xiaomi_ugglite_overlay \
    xiaomi_wt8937_overlay \
    xiaomi_wt8937_overlay_Settings

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_fingerprint/android.hardware.fingerprint.xml

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/mixer_paths/,$(TARGET_COPY_OUT_ODM)/etc/) \
    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/platform_info/,$(TARGET_COPY_OUT_ODM)/etc/)

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/blankfile:$(TARGET_COPY_OUT_ODM)/bin/mm-qcamera-daemon \
    $(LOCAL_PATH)/configs/blankfile:$(TARGET_COPY_OUT_ODM)/etc/camera/.placeholder

PRODUCT_PACKAGES += \
    camera.land \
    camera.prada \
    camera.ulysse \
    camera.wingtech

# Dumpstate
PRODUCT_PACKAGES += \
    libdumpstate_device

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck_ramdisk \
    tune2fs_ramdisk \
    resize2fs_ramdisk

ifeq ($(TARGET_KERNEL_VERSION),4.19)
# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Use FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true
endif

# Fingerprint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/blankfile:$(TARGET_COPY_OUT_ODM)/bin/gx_fpd

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_ulysse \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_wt8937

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_ODM)/usr/keylayout/) \
    $(foreach f, msm8917-sku5-snd-card_Button_Jack.kl msm8920-sku7-snd-card_Button_Jack.kl msm8952-sku1-snd-card_Button_Jack.kl, \
        $(LOCAL_PATH)/keylayout/msm8952-snd-card-mtp_Button_Jack.kl:$(TARGET_COPY_OUT_ODM)/usr/keylayout/$(f))

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sysfs

# Placeholder
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/blankfile:$(TARGET_COPY_OUT_ODM)/bin/.placeholder \
    $(LOCAL_PATH)/configs/blankfile:$(TARGET_COPY_OUT_ODM)/lib64/.placeholder

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/Mi8937/proprietary/vendor/bin/hvdcp_opti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hvdcp_opti

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom_ramdisk \
    init.baseband.sh \
    init.goodix.sh \
    init.xiaomi.device.rc \
    init.xiaomi.device.sh

# Shims
PRODUCT_PACKAGES += \
    libbinder_shim \
    libfakelogprint \
    libshim_mutexdestroy \
    libshim_pthreadts \
    libshims_android \
    libshims_ui \
    libwui

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_ODM)/lib64/libhidlbase-v32.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch HAL
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.xiaomi_mi8937

# Wifi
PRODUCT_PACKAGES += \
    WifiOverlay_prada

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/Mi8937/Mi8937-vendor.mk)
