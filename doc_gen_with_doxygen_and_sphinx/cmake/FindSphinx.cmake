# Fix SPHINX_EXECUTABLE can't be found error
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH}" ${PROJECT_SOURCE_DIR}/.venv/Scripts)

# Look for an executable called sphinx-build
find_program(
    SPHINX_EXECUTABLE
    NAMES sphinx-build
    DOC "Path to sphinx-build executable"
)

include(FindPackageHandleStandardArgs)

# Handle standard arguments to find_package like REQUIRED and QUIET
find_package_handle_standard_args(
    Sphinx
    "Failed to find sphinx-build executable"
    SPHINX_EXECUTABLE
)
