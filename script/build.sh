#!/bin/bash

PROFILE_PATH="/usr/share/archiso/configs/releng"

mkdir -p build
mkdir -p bin

mkarchiso -v -w build -o bin $PROFILE_PATH
