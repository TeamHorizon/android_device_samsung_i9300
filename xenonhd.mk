# Release name
PRODUCT_RELEASE_NAME := i9300

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/samsung/smdk4412-common/common.mk)
$(call inherit-product, device/samsung/i9300/i9300.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit common product files.
$(call inherit-product, vendor/xenonhd/config/common_full_phone.mk)

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := 
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := i9300
PRODUCT_NAME := xenonhd_i9300
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9300

# Device Maintainer
PRODUCT_PROPERTY_OVERRIDES += ro.xenonhd.maintainer="BenLue"
TARGET_VENDOR := 

# Root options
ROOT_METHOD=magisk -- to compile builds with Magisk root
ROOT_METHOD=su -- to compile builds with default su provided by LineageOS
# Without any of these flags the builds will be unrooted and won't include Adaway & KernelAdiutor

# 3rd party apps - choose which you want to build
PRODUCT_PACKAGES += \
    Adaway \
    KernelAdiutor \
    MiXplorer

# Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
		PRODUCT_NAME=m0xx \
		TARGET_DEVICE=m0 \
		BUILD_FINGERPRINT="samsung/m0xx/m0:4.3/JSS15J/I9300XXUGMJ9:user/release-keys" \
		PRIVATE_BUILD_DESC="m0xx-user 4.3 JSS15J I9300XXUGMJ9 release-keys"
endif
