// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root

    readonly property int cs: {
        if(!target) {
            return Qt.Unchecked
        }

        if(target.checkState !== undefined) {
            return target.checkState
        }

        return target.checked ? Qt.Checked : Qt.Unchecked
    }
    readonly property bool active: cs !== Qt.Unchecked
    property var target

    implicitWidth: 20
    implicitHeight: 20
    radius: Theme.radiusSmall
    color: !target.enabled ? (active ? Theme.secondary : Theme.disabledFill)
        : active ? (target.down ? Theme.primaryPress : target.hovered ? Theme.primaryHover : Theme.primary)
            : target.down ? Theme.layer(Theme.field, Theme.text, false, true) : Theme.field
    border.width: active ? 0 : 1.5
    border.color: !target.enabled ? Theme.borderDisabled
        : active ? Theme.primaryBorder
            : target.hovered ? Theme.textSecondary : Theme.border

    Behavior on color {
        ColorAnimation {
            duration: Theme.normal
        }
    }

    Check {
        anchors.centerIn: parent
        visible: root.cs === Qt.Checked
        color: root.target.enabled ? Theme.textOnPrimary : Theme.surface
    }

    Rectangle {
        anchors.centerIn: parent
        width: 10
        height: 2
        radius: 1
        visible: root.cs === Qt.PartiallyChecked
        color: root.target.enabled ? Theme.textOnPrimary : Theme.surface
    }
}
