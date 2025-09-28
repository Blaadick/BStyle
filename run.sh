qmlApp=$1

cmake -B cmake-build-release -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release -j "$(nproc --ignore=2)"
sudo cp -r ./cmake-build-release/qml/BStyle /usr/lib/qt6/qml

QT_QUICK_CONTROLS_STYLE=BStyle $qmlApp
