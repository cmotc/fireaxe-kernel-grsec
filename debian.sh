#! /bin/sh

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi

cd $TOME

cp arch/arm/configs/antmseven_config .config
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make olddefconfig
make deb-pkg
#make mrproper
