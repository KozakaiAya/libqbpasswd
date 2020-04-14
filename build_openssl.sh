#!/bin/bash
curr_dir=$(pwd)

openssl_build_dir="$curr_dir/build"
mkdir $openssl_build_dir

$curr_dir/openssl/config --prefix="$openssl_build_dir" threads no-shared no-dso no-comp CXXFLAGS="-std=c++14 -ffunction-sections -fdata-sections" LDFLAGS="-Wl,--no-as-needed -ldl -lpthread -pthread"
make -j$(nproc)
make install_sw install_ssldirs

