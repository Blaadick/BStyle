// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GroupBox {
    default property alias content: column.data

    padding: 10
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignTop

    ColumnLayout {
        id: column
        anchors.fill: parent
        spacing: 8
    }
}
