#! /bin/sh
tar xvfJ /usr/src/linux-grsec-source-4.7.tar.xz -C ./.tmp
cp -Rfv .tmp/*/* $HOME/Projects/nightly-env/fireaxe-kernel-grsec/
xz -dk /usr/src/linux-patch-4.7-grsec.patch.xz ./.tmp/linux-patch-4.7-grsec.patch
cp ./.tmp/linux-patch-4.7-grsec.patch $HOME/Projects/nightly-env/
patch -p1 < ../linux-patch-4.7-grsec.patch
\rm -rf .tmp

