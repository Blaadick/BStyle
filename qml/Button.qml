// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls

Button {
    id: control

    scale: pressed ? 0.97 : (hovered ? 1.03 : 1)

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: "#2d2d2d"
        radius: 10
    }

    Behavior on scale { ScaleAnim {} }
}
