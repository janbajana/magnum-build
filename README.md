# Magnum Build

Build all Magnum projects, it's dependencies and samples from single project using CMake.

CMake will configure and build following targets:
- Corrade - [https://github.com/mosra/corrade](https://github.com/mosra/corrade)
- Magnum - [https://github.com/mosra/magnum](https://github.com/mosra/magnum)
- Magnum Plugins - [https://github.com/mosra/magnum-plugins](https://github.com/mosra/magnum-plugins)
- Magnum Integration - [https://github.com/mosra/magnum-integration](https://github.com/mosra/magnum-integration)
- Magnum Bootstrap (optional) - [https://github.com/mosra/magnum-bootstrap](https://github.com/mosra/magnum-bootstrap)
- Magnum Examples (optional) - [https://github.com/mosra/magnum-examples](https://github.com/mosra/magnum-examples)
- Magnum Extras (optional) - [https://github.com/mosra/magnum-extras](https://github.com/mosra/magnum-extras)

This configuration is tested on platforms:

- Linux
- MAC
- Android

# Prerequisites

- [Setup MAC](doc/setup-mac.md)

- [Setup Linux](doc/setup-linux.md)

# How to get started

Clone following Magnum projects to one root directory just beside your `magnum-build` project.

```
git clone git@github.com:mosra/corrade.git
git clone git@github.com:mosra/magnum.git
git clone git@github.com:mosra/magnum-plugins.git
git clone git@github.com:mosra/magnum-integration.git
git clone git@github.com:mosra/magnum-examples.git
git clone git@github.com:mosra/magnum-extras.git
git clone -b <base/base-android/...> git@github.com:mosra/magnum-bootstrap.git
git clone git@github.com:janbajana/magnum-build.git
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

## Configure using script helpers

The project includes `./scripts/*.sh` helper scripts to setup CMake with all avaiable options.

To see how magnum projects can be configured try to run:

```
$ ./scripts/setup-dev-desktop.sh Release
$ cd ./build/Desktop-Release
$ ninja -j6
```

for Android

```
$ ./scripts/setup-dev-android.sh Release
$ cd ./build/Desktop-Release
$ ninja -j6
```

If you build `magnum-axamples` for Android you have to chekcout branch from here, only `magnum-triangle` is currrently configurable:

```
git clone -b origin/jb/android-build git@github.com:janbajana/magnum-examples.git
```

# Configure with IDE

- [Configure VS Code](doc/configure-vs-code.md)
