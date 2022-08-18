#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_Mi8937.mk

COMMON_LUNCH_CHOICES := \
    lineage_Mi8937-user \
    lineage_Mi8937-userdebug \
    lineage_Mi8937-eng

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/aosp_Mi8937.mk

COMMON_LUNCH_CHOICES += \
    aosp_Mi8937-user \
    aosp_Mi8937-userdebug \
    aosp_Mi8937-eng
