// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Item {
    id: root

    property bool vertical: false
    property bool hovered: false
    property bool pressed: false
    property real inset: Theme.radius

    implicitWidth: vertical ? 3 : 0
    implicitHeight: vertical ? 0 : 3

    Rectangle {
        x: root.vertical ? (root.width - width) / 2 : root.inset
        y: root.vertical ? root.inset : (root.height - height) / 2
        width: root.vertical ? 3 : root.width - 2 * root.inset
        height: root.vertical ? root.height - 2 * root.inset : 3
        radius: 1.5
        color: root.hovered || root.pressed ? Theme.handleHover : Theme.handle

        Behavior on color {
            ColorAnimation {
                duration: Theme.normal
            }
        }
    }
}
