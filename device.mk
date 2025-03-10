LOCAL_PATH := device/samsung/m12

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

# Props
PRODUCT_PROPERTY_OVERRIDES +=\
    ro.fastbootd.available=true
    ro.boot.dynamic_partitions=true 
	
# TWRP Fastbootd
TW_INCLUDE_FASTBOOTD := true

# TWRP
TW_INCLUDE_PYTHON := true
TW_EXCLUDE_APEX := true
