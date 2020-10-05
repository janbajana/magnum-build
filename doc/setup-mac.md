# 1. Install Dependencies

## 1.1 Prerequisites

`brew install cmake`

`brew install ninja`

`brew install git`

`brew install pkg-config`

`brew install coreutils`

`brew install SDL2`

It is recommended to have installed `Xcode` as well.

## 1.2 Android SDK/NDK Tools

You can install Android SDK tools using `Homebrew` or from Android Studio directly. Skip this section if you do not target Android.

The Android NDK/SDK and tools needs to be available from following environment variables:
```
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
export ANDROID_HOME=/<path>/<to>/Android/Sdk
export ANDROID_SDK=$ANDROID_HOME

export ANDROID_NDK=${ANDROID_HOME}/ndk/<version>
export ANDROID_NDK_HOME=$ANDROID_NDK

export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_NDK_HOME
```

Save this configuration in

* `$ ~/.bash_profile`
* `$ ~/.zshenv`

After you set the paths restart the Terminal or run:

* `$ source ~/.bash_profile`

Start using

* `$ adb devices`
