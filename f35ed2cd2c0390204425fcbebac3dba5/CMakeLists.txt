cmake_minimum_required(VERSION 3.5)
project(test)

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
else()
    include(${PROJECT_SOURCE_DIR}/build/conanbuildinfo.cmake)
endif()
conan_basic_setup()

# CMake option
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

aux_source_directory(src SRC)

add_executable(${PROJECT_NAME} ${SRC})
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})
