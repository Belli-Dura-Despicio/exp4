SPDK_ROOT_DIR := ~/spdk
include $(SPDK_ROOT_DIR)/mk/spdk.common.mk
include $(SPDK_ROOT_DIR)/mk/spdk.modules.mk
 
APP = test_blob
 
C_SRCS := test_blob.c
 
SPDK_LIB_LIST = $(ALL_MODULES_LIST) event event_bdev
 
include $(SPDK_ROOT_DIR)/mk/spdk.app.mk
 
run: all
	@ rm -f test_blob.d test_blob.o
	@ $(SPDK_ROOT_DIR)/scripts/gen_nvme.sh --json-with-subsystems > ./test_bdev.json
	@ sudo ./test_blob ./test_bdev.json