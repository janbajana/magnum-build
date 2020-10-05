# 1. Install Dependencies

## 1.1 Prerequisites

### Ubuntu

`sudo apt install build-essential`

`sudo apt install cmake`

`sudo apt install ninja`

`sudo apt install git`

`sudo apt install doxygen`

`sudo apt install sdl2-dev`

## 1.2 Android SDK/NDK Tools

You can install Android SDK tools using package manager or Android Studio directly.

The Android NDK/SDK and tools needs to be available and the following environment variables should be set:

```
export JAVA_HOME=/snap/android-studio/90/android-studio/jre
export ANDROID_HOME=/<path>/<to>/Android/Sdk
export ANDROID_SDK=$ANDROID_HOME

export ANDROID_NDK=${ANDROID_HOME}/ndk/<version>
export ANDROID_NDK_HOME=$ANDROID_NDK

export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools         
export PATH=${PATH}:$ANDROID_NDK_HOME

export HAWAII_NDK_HOME=/usr/local/hawaii-ndk-x86_64
```

You can save configuration in:

* `~/.bash_profile` (VS Code sets env from here)
* `~/.bashrc`

After you set the paths restart the Terminal or run:

* `$ bash`

Start using

* `adb devices`
