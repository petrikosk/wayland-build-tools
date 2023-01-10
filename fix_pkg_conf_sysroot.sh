#!/bin/bash
# Source: https://github.com/pkgconf/pkgconf/issues/213
# 2023-01-05 Added support for versions and variables

set -e

mangle_pkg_config_result() {

    local OPTIND o a neednewline nline
    nline=$'\n'
    while getopts ":l:L:I:D:W:v:i:" o; do
                    
        case "${o}" in
             L | I )
                if [[ -e "${OPTARG}" ]] 
                then 
                  RET="${RET}-${o}${OPTARG} " 
                  #echo -n "-${o}${OPTARG} " 
                else
                  RET="${RET}-${o}${OPTARG##$PKG_CONFIG_SYSROOT_DIR} "
                  #echo -n "-${o}${OPTARG##$PKG_CONFIG_SYSROOT_DIR} "
                fi
                neednewline=1
                ;;
            l | D | W )
                RET="${RET}-${o}${OPTARG} "  
                #RET="$@ "
                neednewline=1
                ;;
            v )
                if [[ -e "${OPTARG}" ]] 
                then
                  RET="${RET}${OPTARG} "
                else
                  RET="${RET}${OPTARG##$PKG_CONFIG_SYSROOT_DIR}"
                fi
                neednewline=1
                ;;
            i )
                RET="$@ "
                neednewline=1
                ;;
            *)
                RET="${RET}-${o}"
                neednewline=1
        esac
    done
    shift $((OPTIND-1))
    if [[ $neednewline -ne 0 ]] ; then RET="${RET}${nline}" ; fi
}

logfile="/tmp/pkg.log"
echo "args: $@" >> $logfile

if [[ "$1" == *"version"* || "$1" == *"help"* ]] ; then 
    string=$(pkg-config "$@")
    ret=$?
    echo "output: ${string}" >> $logfile
    echo $string
    exit ${ret}
fi

string=$(pkg-config "$@")
ret=$?
if [[ ${RET} -ne 0 ]] ; then echo "output: ${string}" >> $logfile >> $logfile; echo $string; exit ${ret} ; fi

if [[ "$@" == *"--variable"* && -n $string ]] ; then string="-v $string";
fi
mangle_pkg_config_result $string
echo ${RET}
echo "output: ${RET}" >> $logfile