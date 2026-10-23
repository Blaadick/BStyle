#!/usr/bin/bash

cmake -B cmake-build-release-linux -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-linux --parallel

export QSG_RHI_BACKEND=vulkan
export QT_LOGGING_RULES="qt.qpa.wayland.textinput=false"
qml6 -I cmake-build-release-linux example/Example.qml -style BStyle
