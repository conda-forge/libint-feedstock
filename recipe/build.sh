#!/bin/bash

set -x
echo ${PREFIX}
export CXXFLAGS="${CXXFLAGS} -fopenmp"

mkdir -p build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build . --target install -- -j${CPU_COUNT}
