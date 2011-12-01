# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_LIBSECRIL_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/fascinatemtd/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_BOARD_PLATFORM := s5pv210
TARGET_BOOTLOADER_BOARD_NAME := aries
TARGET_RECOVERY_INITRC := device/samsung/aries-common/recovery.rc

BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/fascinatemtd/releasetools/fascinatemtd_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/fascinatemtd/releasetools/fascinatemtd_img_from_target_files

# Hardware rendering
USE_OPENGL_RENDERER := true

# Camera
USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Video Devices
BOARD_USES_OVERLAY := true
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0

BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_BASE := 0x32000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 init=/init no_console_suspend
TARGET_PREBUILT_KERNEL := device/samsung/fascinatemtd/kernel

BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 262144000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1665130496
BOARD_FLASH_BLOCK_SIZE := 4096

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4329
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/aries-common/recovery/graphics.c
BOARD_USES_BML_OVER_MTD := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/fascinatemtd/shbootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"

TARGET_OTA_ASSERT_DEVICE := aries,fascinate,fascinatemtd,SCH-I500
