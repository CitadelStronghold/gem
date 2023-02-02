#!/bin/bash

##

GEM_ROOTFS_PATH="${1:-./rootfs}"

TEMPLATE_PATH="/usr/share/archiso/configs/releng"
PROFILE_PATH="/root/gemlive"

##

echo "[gem] [prepare]"

##

cp -r $TEMPLATE_PATH $PROFILE_PATH
cp -r $GEM_ROOTFS_PATH/* $PROFILE_PATH/airootfs

git clone https://github.com/GeodeGames/gem-scripts.git $PROFILE_PATH/airootfs/opt/gem
bash $PROFILE_PATH/airootfs/opt/gem/install.sh $PROFILE_PATH/airootfs/opt/gem $PROFILE_PATH/airootfs/usr/bin

echo 'git' | tee -a $PROFILE_PATH/packages.x86_64

##

echo "[gem] [build]"

##

cd /root

mkdir -p "$(pwd)"/build
mkdir -p "$(pwd)"/bin

mkarchiso -v -w "$(pwd)"/build -o "$(pwd)"/bin $PROFILE_PATH

if [[ -d "/gem" ]]; then
    cp /root/bin/*.iso /gem/gem.iso
fi

##
