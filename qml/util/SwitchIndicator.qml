// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root

    property var target

    implicitWidth: 44
    implicitHeight: 24
    radius: height / 2
    color: !target.enabled ? (target.checked ? Theme.secondary : Theme.disabledFill)
        : target.checked ? (target.down ? Theme.primaryPress : target.hovered ? Theme.primaryHover : Theme.primary)
            : Theme.field
    border.width: target.checked ? 0 : 1.5
    border.color: !target.enabled ? Theme.borderDisabled
        : target.checked ? Theme.primaryBorder : Theme.border

    Behavior on color {
        ColorAnimation {
            duration: Theme.normal
        }
    }

    Rectangle {
        id: handle
        width: 16
        height: 16
        radius: 8
        y: (root.height - height) / 2
        x: 4 + root.target.visualPosition * (root.width - width - 8)
        color: !root.target.enabled ? Theme.textDisabled
            : root.target.checked ? Theme.textOnPrimary : Theme.textSecondary

        Behavior on x {
            enabled: !root.target.down

            NumberAnimation {
                duration: Theme.normal
                easing.type: Easing.OutCubic
            }
        }

        Behavior on color {
            ColorAnimation { duration: Theme.normal }
        }
    }
}
