LOCAL_PATH := $(call my-dir)

##################################################################
# http://developer.android.com/intl/ja/ndk/guides/android_mk.html
# TARGET_ARCH_ABI := armeabi-v7a
# ARMv5TE 	armeabi
# ARMv7 	armeabi-v7a
# ARMv7 	armeabi-v7a-hard
# ARMv8 AArch64 	arm64-v8a
# i686 	x86
# x86-64 	x86_64
# mips32 (r1) 	mips
# mips64 (r6) 	mips64
# All 	all

##################################################################
# Enable to be able to use ALOG* with #include "cutils/log.h"
#log_c_includes += system/core/include
#log_shared_libraries := liblog

##################################################################
# These makefiles are here instead of being Android.mk files in the
# respective crypto, ssl, and apps directories so
# that import_openssl.sh import won't remove them.
include $(LOCAL_PATH)/build-config-64.mk
include $(LOCAL_PATH)/build-config-32.mk

ifeq (crypto,$(findstring crypto,$(APP_MODULES)))
  include $(LOCAL_PATH)/Crypto.mk
else
  include $(LOCAL_PATH)/Ssl.mk
endif
#include $(LOCAL_PATH)/Apps.mk
