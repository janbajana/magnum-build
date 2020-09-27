cmake_minimum_required(VERSION 3.4)
project(MagnumBuild)

option(BUILD_WITH_MAGNUM_BOOTSTRAP  "Configure Magnum Bootstrap project if avaiable." OFF)
option(BUILD_WITH_MAGNUM_EXAMPLES   "Configure Magnum Examples project if avaiable." OFF)
option(BUILD_WITH_MAGNUM_EXTRAS     "Configure Magnum Extras project if avaiable." OFF)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/modules/" ${CMAKE_MODULE_PATH})

# Add Corrade as a subproject
set(corrade_path "${CMAKE_CURRENT_LIST_DIR}/../corrade")
if (EXISTS "${corrade_path}")
    add_subdirectory("${corrade_path}" corrade)
else()
    message(FATAL_ERROR "Corrade path does not exist")
endif()

# Add Magnum as a subproject, enable Sdl2Application
set(WITH_SDL2APPLICATION ON CACHE BOOL "" FORCE)
set(magnum_path "${CMAKE_CURRENT_LIST_DIR}/../magnum")
if (EXISTS "${magnum_path}")
    add_subdirectory("${magnum_path}" magnum)
else()
    message(FATAL_ERROR "Magnum path does not exist")
endif()

# Add Magnum Plugins
set(magnum_plugins_path "${CMAKE_CURRENT_LIST_DIR}/../magnum-plugins")
if (EXISTS "${magnum_plugins_path}")
    add_subdirectory("${magnum_plugins_path}" magnum-plugins)
else()
    message(FATAL_ERROR "Magnum plugins path does not exist")
endif()

# Add Magnum Plugins
set(magnum_integration_path "${CMAKE_CURRENT_LIST_DIR}/../magnum-integration")
if (EXISTS "${magnum_integration_path}")
    # check if imgui is avaible locally.
    set(imgui_path "${CMAKE_CURRENT_LIST_DIR}/../imgui")
    if (EXISTS "${imgui_path}")
        set(IMGUI_DIR "${CMAKE_CURRENT_LIST_DIR}/../imgui")
    else()
        message(SEND_ERROR "imguy path does not exist")
    endif()

    add_subdirectory("${magnum_integration_path}" magnum-integration)
else()
    message(SEND_ERROR "Magnum integration path does not exist")
endif()

# Add Magnum Bootstrap projects if avaiable and enabled
set(magnum_bootstrap_path "${CMAKE_CURRENT_LIST_DIR}/../magnum-bootstrap/src")
if (BUILD_WITH_MAGNUM_BOOTSTRAP AND EXISTS "${magnum_bootstrap_path}")
    add_subdirectory("${magnum_bootstrap_path}" magnum-bootstrap)
endif()

# Add Magnum Examples projects if avaiable and enabled
set(magnum_examples_path "${CMAKE_CURRENT_LIST_DIR}/../magnum-examples")
if (BUILD_WITH_MAGNUM_EXAMPLES AND EXISTS "${magnum_examples_path}")
    add_subdirectory("${magnum_examples_path}" magnum-examples)
endif()

# Add Magnum Extras projects if avaiable and enabled
set(magnum_extras_path "${CMAKE_CURRENT_LIST_DIR}/../magnum-extras")
if (BUILD_WITH_MAGNUM_EXTRAS AND EXISTS "${magnum_extras_path}")
    add_subdirectory("${magnum_extras_path}" magnum-extras)
endif()