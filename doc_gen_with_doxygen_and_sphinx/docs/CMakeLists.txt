# find doxygen
find_package(Doxygen REQUIRED)

# Find all the public headers
get_target_property(DEMO_PUBLIC_HEADER_DIR demo INTERFACE_INCLUDE_DIRECTORIES)
file(GLOB_RECURSE DEMO_PUBLIC_HEADERS ${DEMO_PUBLIC_HEADER_DIR}/*.h)

# Init variables
set(DOXYGEN_INPUT_SETTINGS
    ${PROJECT_SOURCE_DIR}/src
    ${PROJECT_SOURCE_DIR}/scripts
    ${PROJECT_SOURCE_DIR}/Readme.md
)
format_doxygen_input(DOXYGEN_INPUT ${DOXYGEN_INPUT_SETTINGS})
set(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/doxygen)
set(DOXYGEN_INDEX_FILE ${DOXYGEN_OUTPUT_DIR}/html/index.html)
set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/doxyfile.in)
set(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/doxyfile)

# Replace variables inside @@ with the current values
configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)

# Create folder, doxygen won't create this for us
file(MAKE_DIRECTORY ${DOXYGEN_OUTPUT_DIR})

# Add Doxygen target
add_custom_command(
    OUTPUT ${DOXYGEN_INDEX_FILE}
    DEPENDS ${DEMO_PUBLIC_HEADERS}
    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    MAIN_DEPENDENCY ${DOXYFILE_OUT}
    COMMENT "Generating docs"
)
add_custom_target(doxygen ALL DEPENDS ${DOXYGEN_INDEX_FILE})

# Log configurations
message(STATUS "Configurations for docs:")
message(STATUS "    CMAKE_CURRENT_LIST_DIR      = ${CMAKE_CURRENT_LIST_DIR}")
message(STATUS "    CMAKE_CURRENT_BINARY_DIR    = ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "    DEMO_PUBLIC_HEADERS         = ${DEMO_PUBLIC_HEADERS}")
message(STATUS "    DOXYGEN_INPUT               = ${DOXYGEN_INPUT}")
message(STATUS "    DOXYGEN_OUTPUT_DIR          = ${DOXYGEN_OUTPUT_DIR}")
message(STATUS "    DOXYGEN_INDEX_FILE          = ${DOXYGEN_INDEX_FILE}")
message(STATUS "    DOXYFILE_IN                 = ${DOXYFILE_IN}")
message(STATUS "    DOXYFILE_OUT                = ${DOXYFILE_OUT}")
