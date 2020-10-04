#!/bin/bash

set -x

## usage example:
## ./setup-dev-android Release

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
PROJECT_LOCATION="${SCRIPTPATH}/.."

BUILD_TYPE="$1"     # Release/Debug

if [ -z "$1" ]; then
BUILD_TYPE="Release"
fi

# TODO automatic check target platform
BUILD_SYSTEM="Android"
GENERATOR="Ninja"
BUILD_ARCH=arm64-v8a    # arm64-v8a/armeabi-v7a

BUILD_LOCATION=${PROJECT_LOCATION}/build/${BUILD_SYSTEM}-${BUILD_TYPE}

mkdir -p "${BUILD_LOCATION}"
rm -rf "${BUILD_LOCATION}"/*

if [[ -z "${ANDROID_NDK_HOME}" ]]; then
    echo "ANDROID_NDK_HOME environment variable not set!"
    exit 1
fi

cmake -B"${BUILD_LOCATION}" -H"${PROJECT_LOCATION}" -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G"${GENERATOR}" \
    -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" \
    -DCMAKE_ANDROID_NDK="${ANDROID_NDK_HOME}" \
    -DCMAKE_SYSTEM_NAME=Android \
    -DCMAKE_SYSTEM_VERSION=28 \
    -DCMAKE_ANDROID_ARCH_ABI=${BUILD_ARCH} \
    -DANDROID_ABI=${BUILD_ARCH} \
    -DANDROID_NATIVE_API_LEVEL=28 \
    -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang \
    -DCMAKE_ANDROID_STL_TYPE=c++_static \
    -DCORRADE_RC_EXECUTABLE="${PROJECT_LOCATION}/build/Release/Release/bin/corrade-rc" \
    \
    -DBUILD_WITH_MAGNUM_BOOTSTRAP=OFF \
    -DBUILD_WITH_MAGNUM_EXAMPLES=OFF \
    -DBUILD_WITH_MAGNUM_EXTRAS=OFF \
    \
    -DWITH_INTERCONNECT=ON \
    -DWITH_PLUGINMANAGER=ON \
    -DWITH_TESTSUITE=ON \
    -DWITH_UTILITY=ON \
    -DUTILITY_USE_ANSI_COLORS=ON \
    \
    -DWITH_ANDROIDAPPLICATION=ON \
    -DTARGET_GLES2=OFF \
    -DTARGET_GLES3=ON \
    -DWITH_EGLCONTEXT=ON \
    -DBUILD_DEPRECATED=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_GL_TESTS=OFF \
    -DBUILD_STATIC=ON \
    -DBUILD_PLUGINS_STATIC=ON \
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
    -DWITH_IMAGECONVERTER=OFF \
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
    -DWITH_UI_GALLERY=ON