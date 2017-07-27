#!/bin/bash

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DCMAKE_BUILD_TYPE=Debug                    \
      -DANDROID_ABI="armeabi-v7a"                  \
      -DANDROID_PLATFORM="android-21"        \
      .
