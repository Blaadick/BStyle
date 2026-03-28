// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls.impl

Rectangle {
    id: control

    implicitWidth: 40
    implicitHeight: 40
    color: "#26282b"
    radius: 10

    property bool isChecked

    IconImage {
        anchors.fill: parent
        visible: control.isChecked
        name: "gtk-ok"
        color: "#ffffff"
    }
}
