<div align="center">
    <h1>BStyle</h1>
</div>

## Description
Custom style for QML applications.

## Usage
Use env `QT_QUICK_CONTROLS_STYLE=BStyle`. Set it global, or launch application with it.

If your QML application can use QtQuickControl2 styles, it will use it.

## Installation
### Arch Linux
```bash
yay -S bstyle-qml-theme
```

### Manual
```bash
git clone https://github.com/Blaadick/BStyle.git
cd BStyle
cmake -B cmake-build-release -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release --parallel
```

## License
Code is licensed under GPL-3.0-only
