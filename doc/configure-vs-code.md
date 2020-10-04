# 1. Configure VS Code

The CMake Tools extension integrates Visual Studio Code and CMake to make it easy to configure, build, and debug your C++ project.

For more information visit:

[https://code.visualstudio.com/docs/cpp/cmake-linux](https://code.visualstudio.com/docs/cpp/cmake-linux)

## 1.1 Prerequisites

The guide assumes you have installed VS Code. 
To complete this guide, install the following:

1. [C++ extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools).
2. [CMake Tools extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools).

VS Code editor does not come with development tools but instead is directly using tolls installed on your system.
Ensure you have set development tools described in [Setup MAC Machine](MAC-Setup).

# 2. Open the CMake project

Open `magnum-build` project. The project includes root `CMakeLists.txt` and `.vscode` project configuration.

- the project configuration expects that all `magnum-*` projects are cloned in the same root directory.

VS Code has 3 important configurations:

- **Cmake Kit** - a kit represents a toolchain. VSCode will automatically discover kits plus there is custom `Android` configuration in `.vscode`.
- **Cmake Variant** - a build specific variant configurations including build type `Release`, `Debug` plus additional per build options
- **Cmake Settings** - settings which are specific for all variants and kits.

Every combination of variants configure and build a project in a new build folder `build/Android-Release`.

# 2. Configure and build the CMake project

To configure and build the projects follow steps:

1. Select a kit
2. Select a variant
3. CMake: Configure
4. CMake: Build

Video example: configure, build and run on Linux

- [https://youtu.be/GiLEnpzjV64](https://youtu.be/GiLEnpzjV64)

Video example: configure, build and run on Android

- [https://youtu.be/VSRFg6TE8No](https://youtu.be/VSRFg6TE8No)