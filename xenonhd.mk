# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/samsung/i9300/device.mk) -- path to main device makefile

# Inherit common product files.
$(call inherit-product, vendor/xenonhd/config/common_full_phone.mk)

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := 
PRODUCT_BRAND := 
PRODUCT_DEVICE := 
PRODUCT_NAME := xenonhd_device
PRODUCT_MANUFACTURER := 
PRODUCT_MODEL := 
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
    BUILD_FINGERPRINT=specific for your device \
    PRIVATE_BUILD_DESC="specific for your device"
endif
