@ECHO ON
set "LDFLAGS=%LDFLAGS:/link =%"

cmake %CMAKE_ARGS% ^
      -G "Ninja" ^
      -S %SRC_DIR% ^
      -B build ^
      -D CMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_C_FLAGS="/wd4018 /wd4101 /wd4996 %CFLAGS%" ^
      -D CMAKE_CXX_FLAGS="/wd4018 /wd4101 /wd4996 %CXXFLAGS%" ^
      -D CMAKE_INSTALL_LIBDIR="lib" ^
      -D CMAKE_INSTALL_INCLUDEDIR="include" ^
      -D CMAKE_INSTALL_BINDIR="bin" ^
      -D CMAKE_INSTALL_DATADIR="share" ^
      -D BUILD_SHARED_LIBS=OFF ^
      -D Eigen3_ROOT=%PREFIX% ^
      -D ENABLE_XHOST=OFF ^
      -D LIBINT2_REQUIRE_CXX_API=ON ^
      -D LIBINT2_REQUIRE_CXX_API_COMPILED=OFF ^
      -D LIBINT2_ENABLE_FORTRAN="%ENABLE_FORTRAN%" ^
      -D LIBINT2_ENABLE_PYTHON=OFF ^
      -D BUILD_TESTING=OFF ^
      -D CMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: use `--target check install` above to run ctest tests within build phase. adds about 10m. also have to BUILD_TESTING=ON
:: the 6,6 fails w/OOM at 1.5h. CMAKE_BUILD_PARALLEL_LEVEL=1 works in 4h. could try =2.

cd build
set CMAKE_BUILD_PARALLEL_LEVEL=1
cmake --build . ^
      --config Release ^
      --target install
if errorlevel 1 exit 1
