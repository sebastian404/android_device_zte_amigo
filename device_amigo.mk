$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/amigo/amigo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/amigo/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/amigo/recovery_kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/zte/amigo/recovery/etc/usb.conf:/root/usb.conf\
    device/zte/amigo/recovery/sbin/recovery.sh:/root/sbin/recovery.sh

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_amigo
PRODUCT_DEVICE := amigo

pathmap_INCL := recovery:device/zte/amigo/recovery


