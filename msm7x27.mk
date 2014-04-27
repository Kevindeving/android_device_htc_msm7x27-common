#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
# frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \

# wifi-ap interface
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=athap0

# USB
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/ramdisk/init.msm7x27.usb.rc:root/init.msm7x27.usb.rc

# Media
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/msm7x27-common/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/msm7x27-common/media_profiles.xml:system/etc/media_profiles.xml

# Common msm7x27 firmware
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/msm7x27-common/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/msm7x27-common/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    libtinyalsa

### Sensors (Compass, G-Sensor, Proximity, ...)
PRODUCT_PACKAGES += \
    sensors.msm7x27 \
    lights.msm7x27

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \
    libcamera

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    brcm_patchram_plus \
    Superuser

### Add system daemons
PRODUCT_PACKAGES += \
    rild

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Camera and Camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    ro.htc.camerahack=msm7k

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.a1026.nsForVoiceRec = 0 \
    media.a1026.enableA1026 = 1

# Disable ADB authentication until it works
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0	
	
# We have enough storage space to hold precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Device overlays
## Tell the compiler to use overlays found in the following folder:
DEVICE_PACKAGE_OVERLAYS += device/htc/msm7x27-common/overlay

### Artwork
PRODUCT_LOCALES += mdpi

PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi