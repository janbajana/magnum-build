# Magnum Build

Build all Magnum projects and it's dependencies from single project using CMake.

This configuration is currently tested on platforms:

- Linux

# How to get started

Clone following Magnum projects to one root directory just beside your `magnum-build` project.

```
git clone git@github.com:mosra/corrade.git
git clone git@github.com:mosra/magnum.git
git clone git@github.com:mosra/magnum-plugins.git
git clone git@github.com:mosra/magnum-integration.git
git clone git@github.com:mosra/magnum-examples.git
git clone git@github.com:mosra/magnum-extras.git
git clone -b base git@github.com:mosra/magnum-bootstrap.git
```

third-party dependencies

```
git clone git@github.com:ocornut/imgui.git
```

Use cmake to configure the `magnum-build` project. You can pass here cmake options required for all magnum projects. This example is using Nanja generator.

```
$ mkdir build
$ cd build
$ cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DBUILD_WITH_MAGNUM_EXAMPLES=ON
$ ninja -j6
```

This is a minimal configuration which builds only `magnum-triangle` example.

To see how magnum projects can be configured try to run helper script in script folder.

```
$ ./scripts/setup-dev-desktop.sh Release
$ cd ./build/Desktop-Release
$ ninja -j6
```