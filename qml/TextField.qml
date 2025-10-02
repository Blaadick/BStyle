// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls

TextField {
    id: control

    implicitWidth: 90
    implicitHeight: 40

    background: Rectangle {
        anchors.fill: parent
        color: "#2d2d2d"
        radius: 10
    }
}
