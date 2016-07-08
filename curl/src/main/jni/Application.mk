APP_PLATFORM := android-18

####################################################################
# Starting from Android 4.1 (API level 16)
# http://developer.android.com/intl/ja/ndk/guides/application_mk.html
platform_level := $(strip $(subst android-,,$(APP_PLATFORM)))
ifneq (,$(filter 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30,$(platform_level)))
	APP_PIE := true
endif

####################################################################
#APP_OPTIM := release
APP_OPTIM := debug

####################################################################
APP_SHORT_COMMANDS := true

####################################################################
##APP_ABI := armeabi-v7a
## APP_ABI := arm64-v8a
## APP_ABI := x86
## APP_ABI := x86_64
## APP_ABI := mips
## APP_ABI := mips64
APP_ABI := all		# All supported instruction sets 	
## 

ifeq ($(APP_OPTIM),debug)
  APP_MODULES := libcurl-debug
else
  APP_MODULES := libcurl-release
endif
