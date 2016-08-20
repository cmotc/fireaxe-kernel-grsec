#! /bin/sh

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi

cd $TOME

#cp arch/arm/configs/antmseven_config .config
#cp arch/arm/configs/sunxi_fb_defconfig .config
#BUILDS="arch/arm/configs/antmseven_config arch/arm/configs/sunxi_fb_defconfig arch/arm/configs/antm_seven_static"
#for config in $BUILDS; do
#        make mrproper
#        cp arch/arm/configs/antm_seven_static .config
#        export LDFLAGS='-static'
#        export ARCH=arm
#        export CROSS_COMPILE=arm-linux-gnueabihf-
#        make olddefconfig
#        make dtbs
#        make -j4 deb-pkg
#done
cp arch/arm/configs/antm_seven_static .config
export LDFLAGS='-static'
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make olddefconfig
make dtbs
make -j4 deb-pkg
