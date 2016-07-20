#! /bin/sh
cp arch/arm/configs/antmseven_config .config
make deb-pkg
#make mrproper
