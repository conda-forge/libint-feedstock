#!/bin/bash

set -x
echo ${PREFIX}
export CXXFLAGS="${CXXFLAGS} -fopenmp"
./configure --prefix="${PREFIX}" --enable-shared; if [ $? -ne 0 ]; then cat config.log; fi

make -j${CPU_COUNT}
make -j${CPU_COUNT} check
make -j${CPU_COUNT} install
