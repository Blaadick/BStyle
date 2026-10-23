// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Item {
    id: root

    property var target
    property bool emphasized: false
    property bool emphasizedBorder: false
    property bool flat: false
    property real baseRadius: Theme.radius

    readonly property bool hovered: !!target && target.hovered === true
    readonly property bool pressed: !!target && target.down === true
    readonly property bool active: !target || target.enabled === true
    readonly property real radius: baseRadius
    readonly property real borderWidth: flat ? 0 : 1

    implicitWidth: 88
    implicitHeight: Theme.controlHeight

    StateBackground {
        anchors.fill: parent
        target: root.target
        emphasized: root.emphasized
        filled: !root.flat
        baseRadius: root.baseRadius
    }

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: "transparent"
        border.width: root.borderWidth
        border.color: !root.active ? Theme.borderDisabled
            : root.emphasized || root.emphasizedBorder
                ? (root.pressed ? Theme.primaryBorderPress : root.hovered ? Theme.primaryBorderHover : Theme.primaryBorder)
                : root.pressed ? Theme.borderPress : root.hovered ? Theme.borderHover : Theme.border

        Behavior on border.color {
            ColorAnimation {
                duration: Theme.normal
            }
        }
    }
}
