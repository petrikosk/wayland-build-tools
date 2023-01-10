export TOOLCHAIN="/opt/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu"
export SYSROOT="/mnt/work/rk3399/Linux/linux-sdk/buildroot/output/rockchip_rk3399/host/aarch64-buildroot-linux-gnu/sysroot"
export ARCH="armv8-a"
export CARCH="aarch64"
export HOST="aarch64-linux-gnu"
export BUILD="x86_64-linux-gnu"
export PATH="${TOOLCHAIN}/bin:$PATH"
export CFLAGS="-march=${ARCH} --sysroot=$SYSROOT -DEXIT_FAILURE=-1"
export CXXFLAGS="${CFLAGS} --sysroot=$SYSROOT"
export LDFLAGS="--sysroot=${SYSROOT} -L${SYSROOT}/usr/lib -L${SYSROOT}/lib"
export CC="${TOOLCHAIN}/bin/${HOST}-gcc"
export CXX="${TOOLCHAIN}/bin/${HOST}-g++"
export AR="${TOOLCHAIN}/bin/${HOST}-ar"
export AS="${TOOLCHAIN}/bin/${HOST}-as"
export RANLIB="${TOOLCHAIN}/bin/${HOST}-ranlib"
export STRIP="${TOOLCHAIN}/bin/${HOST}-strip"
export CC_FOR_BUILD="${BUILD}-gcc"
export CONFIGURE_FLAGS="--host=${HOST} --build=${BUILD}"
export PKG_CONFIG_SYSROOT_DIR="${SYSROOT}"
export PKG_CONFIG_LIBDIR="${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig"
export PYTHON="/usr/bin/python"
export PATH="${TOOLCHAIN}/bin:$PATH"
#export EXTRA_DEFS="-isystem ${SYSROOT}/usr/include" # Needed for vim build
#export PKG_CONFIG_PATH="${SYSROOT}/lib/pkgconfig"

export PREFIX=/usr
export INCLUDE_XWAYLAND=1
export WLROOT=$HOME/Wayland
export WLD=$WLROOT/install   # change this to another location if you prefer


export WL_BITS=64
export DISTCHECK_CONFIGURE_FLAGS="--with-xserver-path=$XWAYLAND"
export LD_LIBRARY_PATH=$WLD/lib
#export PKG_CONFIG_LIBDIR=$WLD/lib/pkgconfig/:$WLD/share/pkgconfig/:$PKG_CONFIG_LIBDIR
#export PKG_CONFIG="${WLROOT}/fix_pkg_conf_sysroot.sh"
export ACLOCAL_PATH="$SYSROOT/$PREFIX/share/aclocal"
export ACLOCAL="aclocal -I $ACLOCAL_PATH"
export MESON_CROSS_FILE="$HOME/Wayland/arm64.txt"
export INCLUDE_XWAYLAND=TRUE

#export CMAKE_INSTALL_PREFIX=$WLD
#export CMAKE_BUILD_TYPE="Release"
#export LLVM_TARGETS_TO_BUILD=$CARCH
#export CMAKE_BUILD_TYPE="MinSizeRel"
#export CMAKE_CROSSCOMPILING="True"
#export LLVM_TARGET_ARCH="AArch64"
#export CMAKE_CXX_FLAGS="-march=${ARCH}"




