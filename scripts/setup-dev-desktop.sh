#!/bin/bash

set -x

## usage example:
## ./setup-dev-linux Release

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
PROJECT_LOCATION="${SCRIPTPATH}/.."

BUILD_TYPE="$1"     # Release/Debug

if [ -z "$1" ]; then
BUILD_TYPE="Release"
fi

# TODO automatic check target platform
BUILD_SYSTEM="Desktop"
GENERATOR="Ninja"

BUILD_LOCATION=${PROJECT_LOCATION}/build/${BUILD_TYPE}

mkdir -p "${BUILD_LOCATION}"
rm -rf "${BUILD_LOCATION}"/*

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

cmake -B"${BUILD_LOCATION}" -H"${PROJECT_LOCATION}" -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G"${GENERATOR}" \
    \
    -DBUILD_WITH_MAGNUM_BOOTSTRAP=OFF \
    -DBUILD_WITH_MAGNUM_EXAMPLES=ON \
    -DBUILD_WITH_MAGNUM_EXTRAS=ON \
    \
    -DWITH_INTERCONNECT=ON \
    -DWITH_PLUGINMANAGER=ON \
    -DWITH_TESTSUITE=ON \
    -DWITH_UTILITY=ON \
    -DUTILITY_USE_ANSI_COLORS=ON \
    -DBUILD_STATIC=ON \
    \
    -DWITH_SDL2APPLICATION=ON \
    \
    -DWITH_ANYAUDIOIMPORTER=OFF \
    -DWITH_ANYIMAGECONVERTER=ON \
    -DWITH_ANYIMAGEIMPORTER=ON \
    -DWITH_ANYSCENEIMPORTER=ON \
    -DWITH_MAGNUMFONT=ON \
    -DWITH_MAGNUMFONTCONVERTER=ON \
    -DWITH_OBJIMPORTER=ON \
    -DWITH_TGAIMAGECONVERTER=ON \
    -DWITH_TGAIMPORTER=ON \
    -DWITH_WAVAUDIOIMPORTER=OFF \
    -DWITH_DISTANCEFIELDCONVERTER=ON \
    -DWITH_FONTCONVERTER=ON \
    -DWITH_IMAGECONVERTER=ON \
    -DWITH_GL_INFO=ON \
    -DWITH_AL_INFO=OFF \
    -DWITH_DEBUGTOOLS=ON \
    -DWITH_AUDIO=OFF \
    -DWITH_VIDEO=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_GL_TESTS=OFF \
    -DWITH_TEXT=ON \
    -DWITH_TEXTURETOOLS=ON \
    \
    -DWITH_ASSIMPIMPORTER=OFF \
    -DWITH_TINYGLTFIMPORTER=ON \
    -DWITH_STBIMAGEIMPORTER=ON \
    -DWITH_JPEGIMPORTER=OFF \
    -DWITH_PNGIMPORTER=OFF \
    -DWITH_STBTRUETYPEFONT=ON \
    -DWITH_GSTVIDEOIMPORTER=ON \
    -DBUILD_STATIC=ON \
    \
    -DWITH_IMGUI=ON \
    \
    -DWITH_IMGUI_EXAMPLE=ON \
    -DWITH_MOTIONBLUR_EXAMPLE=ON \
    -DWITH_MOUSEINTERACTION_EXAMPLE=ON \
    -DWITH_PICKING_EXAMPLE=ON \
    -DWITH_PRIMITIVES_EXAMPLE=ON \
    -DWITH_SHADOWS_EXAMPLE=ON \
    -DWITH_VIEWER_EXAMPLE=ON \
    -DWITH_TEXT_EXAMPLE=ON \
    -DWITH_TRIANGLE_EXAMPLE=ON \
    -DWITH_TEXTUREDTRIANGLE_EXAMPLE=ON \
    -DWITH_AUDIO_EXAMPLE=OFF \
    -DWITH_VIDEO_EXAMPLE=OFF \
    \
    -DWITH_PLAYER=ON \
    -DWITH_UI=ON \
    -DWITH_UI_GALLERY=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_GL_TESTS=OFF \
    -DBUILD_STATIC=ON