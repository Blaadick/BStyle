#!/usr/bin/bash

cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-linux --parallel
sudo cmake --install cmake-build-release-linux

export QSG_RHI_BACKEND=vulkan
export QT_LOGGING_RULES="qt.qpa.wayland.textinput=false"
qml6 example/Example.qml -style BStyle
