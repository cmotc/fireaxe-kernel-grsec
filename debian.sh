#! /bin/sh

KERNELBASEFOLDER="linux-4.4.4-grsec"
KERNELDEBLOBFOLDER="linux-libre-4.4.4-grsec"
LINUX_KERNEL_WITH_BLOBS="fireaxe-nonfree-grsec"
LINUX_KERNEL_WITHOUT_BLOBS="fireaxe-freelibre-grsec"
PROC=$(nproc)

\rm -rf "$KERNELDEBFOLDER"

if [ -d "fireaxe-kernel-grsec-4.4/.git" ]; then
	cd fireaxe-kernel-grsec-4.4
fi

if [ ! -d "$KERNELDEBLOBFOLDER" ]; then
	echo "Copying Vanilla Linux Kernel for Deblobbing"
	mkdir "$KERNELDEBLOBFOLDER"
	cp "$KERNELBASEFOLDER/linux-4.4.4-grsec.tar.gz" .
	echo "Deblobbing the Kernel."
	./deblob-main --force 4.4 "" '.4-grsec'
fi

echo "Building Libre Kernel"
cd $KERNELDEBLOBFOLDER
make -j$PROC deb-pkg 
cp ../*.changes ../*.dsc ../*.deb ../*.orig.tar.* ../.debian.tar.* ../*.build ../

echo "Building Non-Free Kernel"
cd $KERNELBASEFOLDER 
make -j$PROC deb-pkg 
cp ../*.changes ../*.dsc ../*.deb ../*.orig.tar.* ../.debian.tar.* ../*.build ../

