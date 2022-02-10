# add for fp lib and other file copy

#build sign ta file
PRODUCT_PACKAGES += \
    mafp.elf

BOARD_SEPOLICY_DIRS += vendor/sprd/partner/microarray/sharkl3/sepolicy

PRODUCT_COPY_FILES += \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib/hw/microarray.fingerprint.default.so:vendor/lib/hw/microarray.fingerprint.default.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib/libfprint-x32.so:vendor/lib/libfprint-x32.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib/libfactorylib.so:vendor/lib/libfactorylib.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib/libfactorylib.so:system/lib/libfactorylib.so \
        vendor/sprd/partner/microarray/sharkl3/madev.kl:system/usr/keylayout/madev.kl \
        vendor/sprd/partner/microarray/sharkl3/madev.idc:system/usr/idc/madev.idc \
        vendor/sprd/partner/microarray/init.microarray.rc:vendor/etc/init/init.microarray.rc

ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib64/hw/microarray.fingerprint.default.so:vendor/lib64/hw/microarray.fingerprint.default.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib64/libfprint-x64.so:vendor/lib64/libfprint-x64.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib64/libfactorylib.so:vendor/lib64/libfactorylib.so \
        vendor/sprd/partner/microarray/sharkl3/a088n/lib64/libfactorylib.so:system/lib64/libfactorylib.so
endif
