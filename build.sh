#Build script for G935F_O

#!/bin/bash
DTS=arch/arm64/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=/home/elite/KernelBP/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ANDROID_MAJOR_VERSION=o
export PLATFORM_VERSION=8.0.0
# Cleanup
make clean && make mrproper
# G935F_O Config
make exynos8890-hero2lte_defconfig
make exynos8890-hero2lte_eur_open_04.dtb
make exynos8890-hero2lte_eur_open_08.dtb


# Make zImage
make ARCH=arm64 -j4
echo -n "Build dt.img......................................."

#./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $DTS/
# get rid of the temps in dts directory
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
