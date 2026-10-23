// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root
    implicitWidth: 20
    implicitHeight: 20
    radius: width / 2
    color: enabled ? Theme.primaryStroke : Theme.textDisabled
    border.width: 2
    border.color: Theme.surface

    property bool pressed: false
    property bool hovered: false
    property bool focused: false

    Rectangle {
        z: -1
        anchors.centerIn: parent
        width: parent.width + 14
        height: width
        radius: width / 2
        color: Theme.primaryStroke
        opacity: !root.enabled ? 0 : root.pressed ? 0.26 : (root.hovered || root.focused) ? 0.15 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: Theme.normal
            }
        }
    }
}
