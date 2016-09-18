#! /bin/sh

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi

cd $TOME

#cp arch/arm/configs/antm_seven_config .config
#cp arch/arm/configs/antm_seven_grsec .config
#arch/arm/configs/antm_seven_grsec
#arch/arm/configs/antm_seven_static
#arch/arm/configs/antm_seven_config
#BUILDS="arch/arm/configs/antm_seven_working"
BUILDS="config_new_testing"
for config in $BUILDS; do
        make mrproper
        cp $config .config
        #export LDFLAGS='-static'
        export ARCH=arm
        export CROSS_COMPILE=arm-linux-gnueabihf-
        make olddefconfig
        make dtbs
        make -j4 deb-pkg
        cp arch/arm/boot/zImage ../zimage-$config
done

#cp arch/arm/configs/antm_seven_static .config
#export LDFLAGS='-static'
#export ARCH=arm
#export CROSS_COMPILE=arm-linux-gnueabihf-
#make olddefconfig
#make dtbs
#make -j4 deb-pkg
