// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ScrollView {
    id: root

    property string title
    property string subtitle
    property int minColumnWidth: 340
    readonly property int margin: 10
    default property alias sections: grid.data

    contentWidth: availableWidth
    contentHeight: column.implicitHeight + 2 * margin

    Flickable {
        boundsBehavior: Flickable.StopAtBounds

        ColumnLayout {
            id: column
            x: root.margin
            y: root.margin
            width: root.availableWidth - 2 * root.margin
            spacing: 10

            ColumnLayout {
                spacing: 4
                Layout.fillWidth: true

                Label {
                    text: root.title
                }

                Label {
                    text: root.subtitle
                    wrapMode: Text.WordWrap
                    visible: text.length > 0
                    Layout.fillWidth: true
                }
            }

            GridLayout {
                id: grid
                columns: Math.max(1, Math.floor((column.width + columnSpacing) / (root.minColumnWidth + columnSpacing)))
                rowSpacing: 10
                columnSpacing: 10
                uniformCellWidths: true
                Layout.fillWidth: true
            }
        }
    }
}
