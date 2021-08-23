ASM=nasm

SRC_DIR=src
BUILD_DIR=bin

.PHONY: all floppy_image boot kernel clean always

#
# Floppy Image
#
# $(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
# 	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
# 	truncate -s 1440k $(BUILD_DIR)/main_floppy.img

#
# Bootloader
#
boot: $(BUILD_DIR)/boot.bin

$(BUILD_DIR)/boot.bin: always
	$(ASM) $(SRC_DIR)/boot.asm -f bin -o $(BUILD_DIR)/boot.bin

#
# Kernel (Assembly)
#
kernel: $(BUILD_DIR)/kernel.bin

$(BUILD_DIR)/kernel/kernel.bin: always

#
# Always
#
always:
	mkdir-p $(BUILD_DIR)

#
# Clean
#
clean:
	rm -rf $(BUILD_DIR)/*