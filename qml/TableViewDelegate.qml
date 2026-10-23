// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.TableViewDelegate {
    id: control

    required property int column
    required property int row
    required property var model

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)

    padding: inset
    highlighted: selected
    hoverEnabled: Application.styleHints.useHoverEffects

    contentItem: Text {
        text: control.model.display ?? ""
        font: control.font
        color: !control.enabled ? Theme.textDisabled
            : control.highlighted ? Theme.textOnPrimary : Theme.text
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        visible: !control.editing
    }

    background: Rectangle {
        implicitHeight: Theme.controlHeight
        color: Theme.field

        StateBackground {
            anchors.fill: parent
            target: control
            emphasized: control.highlighted
        }

        Rectangle {
            anchors.fill: parent
            radius: Theme.radius
            color: "transparent"
            border.width: control.current ? 2 : 0
            border.color: control.highlighted ? Theme.primaryBorder : Theme.primaryStroke
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    TableView.editDelegate: FocusScope {
        width: parent.width
        height: parent.height

        TableView.onCommit: {
            const model = control.tableView.model
            if(!model) {
                return
            }

            const index = model.index(control.row, control.column)
            if(!model.setData(index, field.text, Qt.EditRole)) {
                console.warn("The model does not allow setting the EditRole data.")
            }
        }

        Component.onCompleted: field.selectAll()

        TextField {
            id: field
            anchors.fill: parent
            text: control.model.edit ?? control.model.display ?? ""
            topPadding: Theme.inset(height, contentHeight)
            bottomPadding: Theme.inset(height, contentHeight)
            focus: true
        }
    }
}
