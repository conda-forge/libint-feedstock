#!/bin/bash

set -x
echo ${PREFIX}
#export CXXFLAGS="${CXXFLAGS} -fopenmp"

mkdir -p build
cd build
cmake ${CMAKE_ARGS} .. -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_VERBOSE_MAKEFILE=ON -DBUILD_SHARED_LIBS=ON
cmake --build . --target install -- -j${CPU_COUNT}
