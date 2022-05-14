find_package(Doxygen REQUIRED)
find_package(Perl REQUIRED)
find_package(PythonInterp REQUIRED)
find_package(Sphinx REQUIRED COMPONENTS breathe)

function(add_breathe_doc)
    set(options)
    set(oneValueArgs
        SOURCE_DIR
        BUILD_DIR
        CACHE_DIR
        HTML_DIR
        DOXY_FILE
        CONF_FILE
        TARGET_NAME
        COMMENT
    )
    set(multiValueArgs)
    cmake_parse_arguments(BREATHE_DOC
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN}
    )
    # ...
endfunction()
