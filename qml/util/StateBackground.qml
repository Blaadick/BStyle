// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root

    property var target
    property bool hovered: target ? target.hovered === true : false
    property bool pressed: target ? target.down === true : false
    property bool active: target ? target.enabled !== false : true
    property bool emphasized: false
    property bool filled: false
    property real baseRadius: Theme.radius

    implicitWidth: 88
    implicitHeight: Theme.controlHeight
    radius: baseRadius
    color: !active ? (filled ? Theme.disabledFill : Theme.clearFill)
        : emphasized ? (pressed ? Theme.primaryPress : hovered ? Theme.primaryHover : Theme.primary)
            : filled ? Theme.field : Theme.clearFill

    Behavior on color {
        ColorAnimation {
            duration: Theme.normal
        }
    }

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.active && !root.emphasized ? Theme.stateLayer(root.hovered, root.pressed) : Theme.clearLayer

        Behavior on color {
            ColorAnimation {
                duration: Theme.normal
            }
        }
    }

    FocusRing {
        visible: !!root.target && root.target.visualFocus
        baseRadius: root.baseRadius
    }
}
