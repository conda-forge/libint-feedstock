#!/bin/bash

set -x
echo ${PREFIX}
export CXXFLAGS="${CXXFLAGS} -fopenmp"

cmake -H. -Build -DCMAKE_INSTALL_PREFIX=${PREFIX}
cmake --build build --target install -- -j${CPU_COUNT}
