#!/bin/bash

GEM_FILES_PATH="${1:-./files}"

TEMPLATE_PATH="/usr/share/archiso/configs/releng"
PROFILE_PATH="/root/gemlive"

echo "[gem] [prepare]"

cp -r $TEMPLATE_PATH $PROFILE_PATH
cp -r $GEM_FILES_PATH/* $PROFILE_PATH/airootfs

git clone https://github.com/GeodeGames/gem-setup.git $PROFILE_PATH/opt/gem

cd /root

mkdir -p "$(pwd)"/build
mkdir -p "$(pwd)"/bin

echo "[gem] [build]"

mkarchiso -v -w "$(pwd)"/build -o "$(pwd)"/bin $PROFILE_PATH

if [[ -d "/gem" ]]; then
    cp /root/bin/*.iso /gem/gem.iso
fi