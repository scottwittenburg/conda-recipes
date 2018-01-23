#!/usr/bin/env bash
export CFLAGS="-Wall -g -m64 -pipe -O2  -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

if [ $(uname) == "Linux" ];then
    if [ ! -f ${PREFIX}/lib/libgfortran.so ]; then
        ln -s ${PREFIX}/lib/libgfortran.so.3.0.0 ${PREFIX}/lib/libgfortran.so
    fi
fi
python setup.py install
