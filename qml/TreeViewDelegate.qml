// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.TreeViewDelegate {
    id: control

    required property int row
    required property int column
    required property var model
    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)
    readonly property real leadingPadding: isTreeNode ? leftMargin + depth * indentation + (indicator ? indicator.width + spacing : 0) : inset

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        leadingPadding + implicitContentWidth + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    indentation: indicator ? indicator.width : 14
    leftMargin: inset - 2
    spacing: 4
    topPadding: inset
    bottomPadding: inset
    leftPadding: !mirrored ? leadingPadding : width - leadingPadding - implicitContentWidth
    rightPadding: inset
    hoverEnabled: Application.styleHints.useHoverEffects
    highlighted: selected || current || ((treeView.selectionBehavior === TableView.SelectRows || treeView.selectionBehavior === TableView.SelectionDisabled) && row === treeView.currentRow)

    indicator: Item {
        readonly property real indent: control.leftMargin + control.depth * control.indentation

        x: !control.mirrored ? indent : control.width - indent - width
        implicitWidth: 14
        height: control.height

        Chevron {
            anchors.centerIn: parent
            width: 10
            height: 10
            rotation: control.expanded ? 0 : control.mirrored ? 90 : -90
            color: !control.enabled ? Theme.textDisabled
                : control.highlighted ? Theme.textOnPrimary : Theme.textSecondary

            Behavior on rotation {
                NumberAnimation {
                    duration: Theme.normal
                }
            }
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }

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

        Repeater {
            model: control.isTreeNode ? control.depth : 0

            Rectangle {
                required property int index

                readonly property real indent: Math.floor(
                    control.leftMargin + index * control.indentation + control.indicator.width / 2
                )

                x: !control.mirrored ? indent : parent.width - indent - width
                width: 1
                height: parent.height
                color: control.highlighted ? Theme.primaryBorder : Theme.outline

                Behavior on color {
                    ColorAnimation {
                        duration: Theme.normal
                    }
                }
            }
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    TableView.editDelegate: FocusScope {
        width: parent.width
        height: parent.height

        readonly property int role: {
            const index = control.treeView.index(control.row, control.column)
            return control.treeView.model.data(index, Qt.EditRole) !== undefined ? Qt.EditRole : Qt.DisplayRole
        }

        TableView.onCommit: {
            const index = TableView.view.index(control.row, control.column)
            TableView.view.model.setData(index, field.text, role)
        }

        Component.onCompleted: field.selectAll()

        TextField {
            id: field
            x: control.contentItem.x - leftPadding
            width: parent.width - x
            height: parent.height
            text: control.treeView.model.data(control.treeView.index(control.row, control.column), parent.role)
            topPadding: Theme.inset(height, contentHeight)
            bottomPadding: Theme.inset(height, contentHeight)
            focus: true
        }
    }
}
