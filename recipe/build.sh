#!/bin/bash

set -x
echo ${PREFIX}
export CXXFLAGS="${CXXFLAGS} -fopenmp"
./configure --prefix="${PREFIX}" --enable-shared

# Debug
if [ $? -ne 0 ]; then
    echo "\n\nconfig.log:\n"
    cat config.log
fi

make -j${CPU_COUNT}
make -j${CPU_COUNT} check
make -j${CPU_COUNT} install
