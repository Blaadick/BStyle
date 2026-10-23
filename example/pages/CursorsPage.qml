// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    title: "Cursors"
    subtitle: "Hover a tile to see the cursor shape."
    minColumnWidth: 100000

    Repeater {
        model: [
            {
                title: "Basic",
                items: [
                    {name: "ArrowCursor", shape: Qt.ArrowCursor},
                    {name: "UpArrowCursor", shape: Qt.UpArrowCursor},
                    {name: "CrossCursor", shape: Qt.CrossCursor},
                    {name: "IBeamCursor", shape: Qt.IBeamCursor},
                    {name: "PointingHandCursor", shape: Qt.PointingHandCursor},
                    {name: "WhatsThisCursor", shape: Qt.WhatsThisCursor}
                ]
            },
            {
                title: "Resize and split",
                items: [
                    {name: "SizeVerCursor", shape: Qt.SizeVerCursor},
                    {name: "SizeHorCursor", shape: Qt.SizeHorCursor},
                    {name: "SizeBDiagCursor", shape: Qt.SizeBDiagCursor},
                    {name: "SizeFDiagCursor", shape: Qt.SizeFDiagCursor},
                    {name: "SizeAllCursor", shape: Qt.SizeAllCursor},
                    {name: "SplitVCursor", shape: Qt.SplitVCursor},
                    {name: "SplitHCursor", shape: Qt.SplitHCursor}
                ]
            },
            {
                title: "Busy and state",
                items: [
                    {name: "WaitCursor", shape: Qt.WaitCursor},
                    {name: "BusyCursor", shape: Qt.BusyCursor},
                    {name: "ForbiddenCursor", shape: Qt.ForbiddenCursor},
                    {name: "BlankCursor", shape: Qt.BlankCursor}
                ]
            },
            {
                title: "Drag and drop",
                items: [
                    {name: "OpenHandCursor", shape: Qt.OpenHandCursor},
                    {name: "ClosedHandCursor", shape: Qt.ClosedHandCursor},
                    {name: "DragCopyCursor", shape: Qt.DragCopyCursor},
                    {name: "DragMoveCursor", shape: Qt.DragMoveCursor},
                    {name: "DragLinkCursor", shape: Qt.DragLinkCursor}
                ]
            }
        ]

        delegate: Section {
            id: group

            required property var modelData

            title: modelData.title

            GridLayout {
                columns: 4
                rowSpacing: 8
                columnSpacing: 8
                uniformCellWidths: true
                Layout.fillWidth: true

                Repeater {
                    model: group.modelData.items

                    delegate: Frame {
                        id: zone

                        required property var modelData

                        padding: 8
                        Layout.fillWidth: true
                        Layout.preferredHeight: 72

                        HoverHandler {
                            cursorShape: zone.modelData.shape
                        }

                        Label {
                            anchors.centerIn: parent
                            text: zone.modelData.name
                        }
                    }
                }
            }
        }
    }
}
