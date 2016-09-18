#! /bin/sh
tar xvfJ /usr/src/linux-grsec-source-4.7.tar.xz -C ./.tmp
cp -Rfv .tmp/*/* $HOME/Projects/nightly-env/fireaxe-kernel-grsec/
tar xvfJ /usr/src/linux-patch-4.7-grsec.patch.xz -C ./.tmp

