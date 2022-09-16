set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
cmake_minimum_required(VERSION 2.8.12)
project(test)

add_definitions("-std=c++14")

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
else()
    include(${PROJECT_SOURCE_DIR}/build/conanbuildinfo.cmake)
endif()
conan_basic_setup()

add_executable(test main.cpp)
target_link_libraries(test ${CONAN_LIBS})
