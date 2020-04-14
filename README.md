# libqbpasswd
Plain C++ password generation library for qBittorrent v4.2

Based on `https://github.com/qbittorrent/qBittorrent/blob/v4_2_x/src/base/utils/password.cpp`

The `openssl` submodule is currently bound to the `OpenSSL_1_1_1-stable` branch of OpenSSL.

## Build

```bash
apt install -y build-essential pkg-config automake libtool git perl python3 python3-dev wget
apt install -y openssl-dev # For dynamic build
git clone --recurse-submodules https://github.com/KozakaiAya/libqbpasswd.git
cd libqbpasswd

make # For dynamic build
make static_build # For static build
```

## Reference

https://amefs.net/archives/2027.html (For static build)
