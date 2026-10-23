// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    required property string name
    required property var states
    property Component control
    property int cellWidth: 150

    spacing: 8

    Label {
        text: root.name
        elide: Text.ElideRight
        Layout.preferredWidth: root.cellWidth
    }

    Repeater {
        model: root.states

        delegate: Item {
            id: cell

            required property var modelData

            implicitHeight: loader.implicitHeight
            Layout.preferredWidth: root.cellWidth

            Loader {
                id: loader
                width: item && item.implicitWidth > cell.width ? cell.width : implicitWidth
                sourceComponent: root.control

                onLoaded: {
                    const s = cell.modelData
                    if(s.checked) {
                        if("checkable" in item)
                            item.checkable = true
                        item.checked = true
                    }
                    if(s.highlighted && "highlighted" in item)
                        item.highlighted = true
                    if(s.down)
                        item.down = true
                    if(s.enabled === false)
                        item.enabled = false
                }
            }
        }
    }
}
