#!/bin/bash

set -x
echo ${PREFIX}
if [[ "${target_platform}" != "osx-arm64" ]]; then
  export CXXFLAGS="${CXXFLAGS} -fopenmp"
fi

${BUILD_PREFIX}/bin/cmake ${CMAKE_ARGS} \
  -S ${SRC_DIR} \
  -B build \
  -G Ninja \
  -D CMAKE_INSTALL_PREFIX=${PREFIX} \
  -D CMAKE_BUILD_TYPE:STRING=Release \
  -D CMAKE_VERBOSE_MAKEFILE=ON \
  -D CMAKE_CXX_COMPILER=${CXX} \
  -D CMAKE_CXX_FLAGS="${CXXFLAGS}" \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D BUILD_SHARED_LIBS=ON \
  -D Eigen3_ROOT=${PREFIX} \
  -D ENABLE_XHOST=OFF \
  -D LIBINT2_REQUIRE_CXX_API=ON \
  -D LIBINT2_REQUIRE_CXX_API_COMPILED=OFF \
  -D LIBINT2_ENABLE_FORTRAN=OFF \
  -D LIBINT2_ENABLE_PYTHON=OFF \
  -D BUILD_TESTING=ON \
  -D CMAKE_PREFIX_PATH="${PREFIX}"

cmake --build build --target install
