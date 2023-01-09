#!/bin/bash

# /usr/sbin/remove-la-files.sh
# Written for Beyond Linux From Scratch
# by Bruce Dubbs <bdubbs@linuxfromscratch.org>

# Make sure we are running with root privs
# if test "${EUID}" -ne 0; then
#     echo "Error: $(basename ${0}) must be run as the root user! Exiting..."
#     exit 1
# fi

# Make sure PKG_CONFIG_PATH is set if discarded by sudo
source $HOME/.config/wayland-build-tools/wl_defines.sh

OLD_LA_DIR="${SYSROOT}/var/local/la-files"

mkdir -p $OLD_LA_DIR

# Only search directories in /opt, but not symlinks to directories
OPTDIRS=$(find ${SYSROOT}/opt -mindepth 1 -maxdepth 1 -type d)

# Move any found .la files to a directory out of the way
find ${SYSROOT}/usr/lib ${SYSROOT}/lib $OPTDIRS -name "*.la" ! -path "${SYSROOT}/usr/lib/ImageMagick*" \
  -exec mv -fv {} $OLD_LA_DIR \;
###############

# Fix any .pc files that may have .la references

STD_PC_PATH='${SYSROOT}/usr/lib/pkgconfig 
             ${SYSROOT}/usr/share/pkgconfig 
             ${SYSROOT}/usr/local/lib/pkgconfig 
             ${SYSROOT}/usr/local/share/pkgconfig
	           ${SYSROOT}/lib/pkgconfig'

# For each directory that can have .pc files
for d in $(echo $PKG_CONFIG_LIBDIR | tr : ' ') $STD_PC_PATH; do

  # For each pc file
  for pc in $d/*.pc ; do
    if [ $pc == "$d/*.pc" ]; then continue; fi

    # Check each word in a line with a .la reference
    for word in $(grep '\.la' $pc); do
      if $(echo $word | grep -q '.la$' ); then
        mkdir -p $d/la-backup
        cp -fv  $pc $d/la-backup

        basename=$(basename $word )
        libref=$(echo $basename|sed -e 's/^lib/-l/' -e 's/\.la$//')
           
        # Fix the .pc file
        sed -i "s:$word:$libref:" $pc
      fi
    done
  done
done

