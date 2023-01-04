#!/bin/bash
#Source: https://github.com/pkgconf/pkgconf/issues/213

set -e

mangle_pkg_config_result() {

    local OPTIND o a neednewline
    while getopts ":l:L:I:D:W" o; do
        case "${o}" in
             L | I )
                if [[ -e "${OPTARG}" ]] 
                then 
                  echo -n "-${o}${OPTARG} " 
                else
                  echo -n "-${o}${OPTARG##$PKG_CONFIG_SYSROOT_DIR} "
                fi
                neednewline=1
                ;;
            l | D | W )
                echo -n "-${o}${OPTARG} "
                neednewline=1
                ;;
            *)
                echo -n "-${o}"
                neednewline=1
        esac
    done
    shift $((OPTIND-1))
    if [[ $neednewline -ne 0 ]] ; then echo ; fi
}

if [[ "x$1" == "x--version" ]] ; then exec pkg-config "$@"; fi

string=$(pkg-config "$@")
ret=$?
if [[ $ret -ne 0 ]] ; then echo $string; exit $ret ; fi

mangle_pkg_config_result $string