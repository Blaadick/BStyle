// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Effects

MultiEffect {
    id: root

    property real radius: Theme.radius

    maskEnabled: true
    maskSource: mask
    maskThresholdMin: 0.5
    maskSpreadAtMin: 1

    Rectangle {
        id: mask
        width: root.width
        height: root.height
        radius: root.radius
        visible: false
        layer.enabled: true
    }
}
