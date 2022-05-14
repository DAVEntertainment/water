cmake_minimum_required(VERSION 3.15)
project(demo)

# Add the cmake folder so the FindSphinx module is found
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(${PROJECT_SOURCE_DIR}/cmake/Function.cmake)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/src)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/docs)
