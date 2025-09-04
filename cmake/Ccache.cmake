find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    message(STATUS "Ccache found: '${CCACHE_PROGRAM}'")

    set(CCACHE_BASEDIR "${CMAKE_SOURCE_DIR}")
    set(CCACHE_DIR "${CCACHE_BASEDIR}/.ccache")
    make_directory("${CCACHE_DIR}")

    set(CCACHE_LOGFILE "${CCACHE_DIR}/ccache.log")

    set(CCACHE_PROGRAM
        CCACHE_BASEDIR=${CCACHE_BASEDIR}
        CCACHE_DIR=${CCACHE_DIR}
        CCACHE_LOGFILE=${CCACHE_LOGFILE}
        ${CCACHE_PROGRAM}
    )

    set(CMAKE_C_COMPILER_LAUNCHER ${CCACHE_PROGRAM})
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE_PROGRAM})

    add_custom_target("ccache-stats"
        COMMAND ${CCACHE_PROGRAM} --show-stats --verbose
        COMMENT "Display ccache statistics"
    )
    set_target_properties("ccache-stats"
        PROPERTIES
            EXCLUDE_FROM_ALL TRUE
            EXCLUDE_FROM_DEFAULT_BUILD TRUE
    )

    add_custom_target("ccache-reset"
        COMMAND ${CCACHE_PROGRAM} --zero-stats
        COMMENT "Zero the cache statistics"
    )
    set_target_properties("ccache-reset"
        PROPERTIES
            EXCLUDE_FROM_ALL TRUE
            EXCLUDE_FROM_DEFAULT_BUILD TRUE
    )

    add_custom_target("ccache-clear"
        COMMAND ${CCACHE_PROGRAM} --clear
        COMMENT "Clear the entire cache"
    )
    set_target_properties("ccache-clear"
        PROPERTIES
            EXCLUDE_FROM_ALL TRUE
            EXCLUDE_FROM_DEFAULT_BUILD TRUE
    )
else()
    message(STATUS "Ccache not found.")
endif()
