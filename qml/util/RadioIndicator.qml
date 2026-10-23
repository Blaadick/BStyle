// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root

    property var target

    implicitWidth: 20
    implicitHeight: 20
    radius: width / 2
    color: !target.enabled ? Theme.disabledFill : target.down ? Theme.layer(Theme.field, Theme.text, false, true) : Theme.field
    border.width: target.checked ? 2 : 1.5
    border.color: !target.enabled ? Theme.borderDisabled
        : target.checked ? Theme.primaryStroke
            : target.hovered ? Theme.textSecondary : Theme.border

    Behavior on border.color {
        ColorAnimation {
            duration: Theme.normal
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 10
        height: 10
        radius: 5
        color: root.target.enabled ? Theme.primaryStroke : Theme.textDisabled
        scale: root.target.checked ? 1 : 0

        Behavior on scale {
            NumberAnimation {
                duration: Theme.normal
                easing.type: Easing.OutCubic
            }
        }
    }
}
