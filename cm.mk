# Release name
PRODUCT_RELEASE_NAME := mproject3g

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/mproject3g/full_mproject3g.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mproject3g
PRODUCT_NAME := cm_mproject3g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-C101
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mproject3gxx \
    TARGET_DEVICE=mproject3g \
    PRIVATE_BUILD_DESC="mproject3gxx-user 4.4.2 KOT49H C101XXUBNF4 release-keys" \
    BUILD_FINGERPRINT="samsung/mproject3gxx/mproject3g:4.4.2/KOT49H/C101XXUBNF4:user/release-keys"
