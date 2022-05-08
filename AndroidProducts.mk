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
    $(LOCAL_DIR)/cipher_Mi8937.mk

COMMON_LUNCH_CHOICES += \
    cipher_Mi8937-user \
    cipher_Mi8937-userdebug \
    cipher_Mi8937-eng
