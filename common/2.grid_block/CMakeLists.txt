cmake_minimum_required(VERSION 3.5.1)
message(STATUS "CMake version: ${CMAKE_VERSION}")

project(grid_block)

option(USE_CUDA "Use CUDA" ON)

file(GLOB cpu_source_files "${CMAKE_SOURCE_DIR}/src/*.cc")
file(GLOB gpu_source_files "${CMAKE_SOURCE_DIR}/src/*.cu")

if( ("${CMAKE_VERSION}" VERSION_EQUAL 3.8) OR
        ("${CMAKE_VERSION}" VERSION_GREATER 3.8) )
    # Modern CMake
    if(USE_CUDA)
        enable_language("CUDA")
        add_executable(grid_block ${cpu_source_files} ${gpu_source_files})
    else(USE_CUDA)
        add_executable(grid_block ${cpu_source_files})
    endif()
else()
    # Old CMake
    add_executable(grid_block ${cpu_source_files})
    if(USE_CUDA)
        find_package(CUDA 10.2)
        if(NOT CUDA_FOUND)
            message(STATUS "CUDA not found")
            set(USE_CUDA OFF)
        else()
            CUDA_ADD_LIBRARY(grid_block_gpu ${gpu_source_files})
            target_link_libraries(grid_block grid_block_gpu)
        endif()
    endif()
endif()

message(STATUS "USE_CUDA: ${USE_CUDA}")
if(USE_CUDA)
    add_definitions(-DUSE_CUDA)
endif()