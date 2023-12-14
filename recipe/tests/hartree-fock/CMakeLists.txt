cmake_minimum_required(VERSION 3.16)
project(hf++)

find_package(Threads)

find_package(Libint2 2.8.0 REQUIRED COMPONENTS eri_dddd_d0 ss)
get_target_property(_l2_loc Libint2::int2 LOCATION)
# avail as reg var but not target var for now get_target_property(_l2_ver Libint2::int2 Libint2_VERSION)
# avail as reg var but not target var for now get_target_property(_l2_mam Libint2::int2 Libint2_MAX_AM_ERI)
# wait until target var message(STATUS "Found Libint2 ${_l2_mam}: ${_l2_loc} (found version ${_l2_ver})")
message(STATUS "Found Libint2 ${Libint2_MAX_AM_ERI}: ${_l2_loc} (found version ${Libint2_VERSION})")

add_executable(hf++ "hartree-fock++.cc")
target_link_libraries(hf++ Libint2::cxx Threads::Threads)
