#! /bin/sh

KERNELBASEFOLDER="linux-4.4.4-grsec"
KERNELDEBLOBFOLDER="linux-libre-4.4.4-grsec-gnu"
LINUX_KERNEL_WITH_BLOBS="fireaxe-nonfree-grsec"
LINUX_KERNEL_WITHOUT_BLOBS="fireaxe-freelibre-grsec"
PROC=$(nproc)

\rm -rf "$KERNELDEBFOLDER"

if [ ! -d "$KERNELDEBLOBFOLDER" ]; then
	echo "Copying Vanilla Linux Kernel for Deblobbing"
	mkdir "$KERNELDEBLOBFOLDER"
	cp "$KERNELBASEFOLDER/linux-4.4.4-grsec.tar.gz" .
	echo "Deblobbing the Kernel."
	./deblob-main --force 4.4 "" '.4-grsec'
fi

echo "Building Libre Kernel"
dash -c "cd $KERNELDEBLOBFOLDER && make -j$PROC deb-pkg 1> /dev/null" & 
# && echo 1 > done-free" &

echo "Building Non-Free Kernel"
#dash -c "cd "$KERNELBASEFOLDER" && make -j$PROC deb-pkg 1> /dev/null" &
# && echo 1 > done-nonfree" &

#while [ ! -f "done-nonfree" ]; do
#	sleep
#	while [ ! -f "done-free" ]; do
#		sleep
#	done
#	echo "Free Kernel Built"
#done
echo "Non-Free Kernel Built"

