#! /bin/sh

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi

cd $TOME

#cp arch/arm/configs/antmseven_config .config
#cp arch/arm/configs/sunxi_fb_defconfig .config
cp arch/arm/configs/antm_seven_static .config
export LDFLAGS='-static'
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make olddefconfig
make dtbs
#fakeroot debian/rules binary
make -j4 deb-pkg
#make mrproper
