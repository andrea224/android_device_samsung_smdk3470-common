# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := samsung

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal3470
TARGET_NO_BOOTLOADER := true

# Filesystems
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk

# Use dlmalloc instead of jemalloc for mallocs
#MALLOC_SVELTE := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/samsung/smdk3470-common/include

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := zImage
LZMA_RAMDISK_TARGETS := recovery

# Platform
TARGET_BOARD_PLATFORM := exynos3
TARGET_SOC := exynos3470

TARGET_LD_SHIM_LIBS := /system/vendor/lib/hw/camera.vendor.universal3470.so|libshim_camera.so

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/rild=27 \
    /system/vendor/bin/hw/android.hardware.camera.provider@2.4-service=22 \
    /system/bin/mediaserver=22

# OpenMAX-shims
TARGET_LD_SHIM_LIBS += \
	/system/lib/omx/libOMX.Exynos.AVC.Decoder.so|/vendor/lib/libui_shim.so \
	/system/lib/omx/libOMX.Exynos.AVC.Encoder.so|/vendor/lib/libui_shim.so \
	/system/lib/omx/libOMX.Exynos.MP3.Decoder.so|/vendor/lib/libui_shim.so \
	/system/lib/omx/libOMX.Exynos.MPEG4.Decoder.so|/vendor/lib/libui_shim.so \
	/system/lib/omx/libOMX.Exynos.MPEG4.Encoder.so|/vendor/lib/libui_shim.so \
	/system/lib/omx/libOMX.Exynos.WMV.Decoder.so|/vendor/lib/libui_shim.so

# Seccomp filters
BOARD_SECCOMP_POLICY += device/samsung/smdk3470-common/configs/seccomp

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
# Use stock HAL
TARGET_EXYNOS3_AUDIO_FROM_SOURCE := false
# Lollipop Audio HAL is incompatible with Android M (see http://review.cyanogenmod.org/#/c/121831/)
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/smdk3470-common/bluetooth/vnd_smdk3470.txt

# Graphics
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x4000000
BOARD_EGL_CFG := device/samsung/smdk3470-common/egl/egl.cfg

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_MODEM_TYPE := ss222

# OpenMAX Video
TARGET_OMX_LEGACY_RESCALING := true

# Sensors (libgui crashes otherwise if SENSOR_PERMISSION_BODY_SENSORS is defined by a sensor)
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# WFD
BOARD_USES_WFD_SERVICE := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/etc/wifi/bcmdhd_p2p.bin"
WIFI_BAND                        := 802_11_ABG