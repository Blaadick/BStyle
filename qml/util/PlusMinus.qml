// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Item {
    id: root
    implicitWidth: 12
    implicitHeight: 12

    property bool plus: true
    property color color: Theme.text

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: 2
        radius: 1
        color: root.color
    }

    Rectangle {
        anchors.centerIn: parent
        width: 2
        height: parent.height
        radius: 1
        color: root.color
        visible: root.plus
    }
}
