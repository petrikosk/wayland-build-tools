export TOOLCHAIN="/opt/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu"
export SYSROOT="/mnt/work/rk3399/Linux/linux-sdk/buildroot/output/rockchip_rk3399/host/aarch64-buildroot-linux-gnu/sysroot"
export ARCH="armv8-a"
export HOST="aarch64-linux-gnu"
export BUILD="x86_64-pc-linux-gnu"
export PATH="${TOOLCHAIN}/bin:$PATH"
export CFLAGS="-march=${ARCH} --sysroot=$SYSROOT"
export CXXFLAGS="${CFLAGS} --sysroot=$SYSROOT"
export LDFLAGS="--sysroot=${SYSROOT} -L${SYSROOT}/usr/lib"
export CC="${TOOLCHAIN}/bin/${HOST}-gcc"
export CXX="${TOOLCHAIN}/bin/${HOST}-g++"
export AR="${TOOLCHAIN}/bin/${HOST}-ar"
export AS="${TOOLCHAIN}/bin/${HOST}-as"
export RANLIB="${TOOLCHAIN}/bin/${HOST}-ranlib"
export STRIP="${TOOLCHAIN}/bin/${HOST}-strip"
export CONFIGURE_FLAGS="--host=${HOST} --build=${BUILD}"
export PKG_CONFIG_SYSROOT_DIR="${SYSROOT}"
export PKG_CONFIG_LIBDIR="${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig"
export PYTHON="/usr/bin/python"
#export PKG_CONFIG_PATH="${SYSROOT}/lib/pkgconfig"

export INCLUDE_XWAYLAND=1
export WLROOT=$HOME/Wayland
export WLD=$WLROOT/install   # change this to another location if you prefer

export WL_BITS=64

XWAYLAND=${WLROOT}/install/bin/Xwayland
export DISTCHECK_CONFIGURE_FLAGS="--with-xserver-path=$XWAYLAND"

export LD_LIBRARY_PATH=$WLD/lib
export PKG_CONFIG_LIBDIR=$WLD/lib/pkgconfig/:$WLD/share/pkgconfig/:$PKG_CONFIG_LIBDIR
export PKG_CONFIG="${WLROOT}/fix_pkg_conf_sysroot.sh"
#export PATH=$WLD/bin:$PATH
export ACLOCAL_PATH="$WLD/share/aclocal"
export ACLOCAL="aclocal -I $ACLOCAL_PATH"
export MESON_CROSS_FILE="$HOME/Wayland/arm64.txt"

