LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

#build signed fingerprint ta
LOCAL_MODULE := mafp.elf

LOCAL_SRC_FILES := sharkl3/a088n/TA/unsign/mafp.elf
ifeq (sp7731e,$(filter sp7731e,$(TARGET_BOARD_PLATFORM)))
LOCAL_SRC_FILES := pike2/afs64N/TA/unsign/mafp.elf
else ifeq (ums512,$(filter ums512,$(TARGET_BOARD_PLATFORM)))
LOCAL_SRC_FILES := sharkl5pro/afs64N/TA/unsign/mafp.elf
else ifeq (ums312,$(filter ums312,$(TARGET_BOARD_PLATFORM)))
LOCAL_SRC_FILES := sharkl5/afs64N/TA/unsign/mafp.elf
else ifeq (ud710,$(filter ud710,$(TARGET_BOARD_PLATFORM)))
LOCAL_SRC_FILES := roc1/afs64N/TA/unsign/mafp.elf
endif

LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware
LOCAL_MODULE_TAGS := optional


sign_script_base_dir := $(PWD)/vendor/sprd/proprietories-source/packimage_scripts/signimage
sign_script := $(sign_script_base_dir)/dynamicTA/signta.py
sign_key := $(sign_script_base_dir)/sprd/config/dynamic_ta_privatekey.pem

src_elf_dir := $(PWD)/vendor/sprd/partner/microarray/sharkl3/a088n/TA/unsign
ifeq (sp7731e,$(filter sp7731e,$(TARGET_BOARD_PLATFORM)))
src_elf_dir := $(PWD)/vendor/sprd/partner/microarray/pike2/afs64N/TA/unsign
else ifeq (ums512,$(filter ums512,$(TARGET_BOARD_PLATFORM)))
src_elf_dir := $(PWD)/vendor/sprd/partner/microarray/sharkl5pro/afs64N/TA/unsign
else ifeq (ums312,$(filter ums312,$(TARGET_BOARD_PLATFORM)))
src_elf_dir := $(PWD)/vendor/sprd/partner/microarray/sharkl5/afs64N/TA/unsign
else ifeq (ud710,$(filter ud710,$(TARGET_BOARD_PLATFORM)))
src_elf_dir := $(PWD)/vendor/sprd/partner/microarray/roc1/afs64N/TA/unsign
endif

target_elf_dir := $(PWD)/$(TARGET_OUT_VENDOR)/firmware
ta_uuid := 4304bef636e54d9194b01ea4cd51d408
ta := mafp

sign_cmd := source $(PWD)/vendor/sprd/partner/microarray/signta.sh $(sign_script) $(ta_uuid) $(sign_key) $(src_elf_dir)/$(ta).elf $(target_elf_dir)/$(ta).elf

LOCAL_ADDITIONAL_DEPENDENCIES := $(src_elf_dir)/$(ta).elf $(sign_key)
LOCAL_POST_INSTALL_CMD := rm $(target_elf_dir)/$(ta).elf; $(sign_cmd)

include $(BUILD_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
