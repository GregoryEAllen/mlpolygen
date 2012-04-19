# This file is part of MLPolyGen, a maximal-length polynomial generator
# for linear feedback shift registers.
# 
# Copyright (C) 2012  Gregory E. Allen
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

cmake_minimum_required(VERSION 2.4)
project(mlpolygen)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMakeModules)
find_package(GMP)
find_package(GMPXX)

include_directories(libs/PrimeFactorizer ${GMPXX_INCLUDE_DIR})

add_executable(mlpolygen src/main.cc src/MLPolyTester.cc)
target_link_libraries(mlpolygen ${GMP_LIBRARIES} ${GMPXX_LIBRARIES})

add_executable(PrimeFactorizer libs/PrimeFactorizer/main.cc)
target_link_libraries(PrimeFactorizer ${GMP_LIBRARIES} ${GMPXX_LIBRARIES})

set(CMAKE_BUILD_TYPE Release)

install(TARGETS mlpolygen RUNTIME DESTINATION bin)
