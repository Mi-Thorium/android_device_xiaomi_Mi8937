#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/bootleg_Mi8937.mk \
    $(LOCAL_DIR)/bootleg_Mi8937_4_19.mk

COMMON_LUNCH_CHOICES := \
    bootleg_Mi8937-user \
    bootleg_Mi8937-userdebug \
    bootleg_Mi8937-eng \
    bootleg_Mi8937_4_19-user \
    bootleg_Mi8937_4_19-userdebug \
    bootleg_Mi8937_4_19-eng
