// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    title: "Containers"
    subtitle: "Panes, pages, toolbars and navigation views."

    Component {
        id: stackPage

        Pane {
            padding: 8

            Label {
                anchors.centerIn: parent
                text: "Depth " + stack.depth
            }
        }
    }

    Section {
        objectName: "containers.basic"
        title: "Frame, Pane, GroupBox"

        Frame {
            padding: 8
            Layout.fillWidth: true

            Label {
                text: "Frame"
            }
        }

        Pane {
            padding: 8
            Layout.fillWidth: true

            Label {
                text: "Pane"
            }
        }

        GroupBox {
            title: "GroupBox"
            padding: 10
            Layout.fillWidth: true

            Label {
                text: "Content"
            }
        }
    }

    Section {
        objectName: "containers.page"
        title: "Page"

        Page {
            Layout.fillWidth: true
            Layout.preferredHeight: 180

            header: ToolBar {
                padding: 4

                Label {
                    anchors.centerIn: parent
                    text: "Header"
                }
            }

            Label {
                anchors.centerIn: parent
                text: "Content"
            }

            footer: DialogButtonBox {
                padding: 10
                spacing: 8
                standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            }
        }
    }

    Section {
        objectName: "containers.toolbar"
        title: "ToolBar"

        ToolBar {
            padding: 4
            Layout.fillWidth: true

            RowLayout {
                anchors.fill: parent
                spacing: 4

                ToolButton {
                    text: "A"
                }

                ToolSeparator {}

                ToolButton {
                    text: "B"
                }

                ToolSeparator {}

                ToolButton {
                    text: "C"
                }

                Item {
                    Layout.fillWidth: true
                }
            }
        }

        Label {
            text: "Horizontal ToolSeparator"
        }

        ToolSeparator {
            orientation: Qt.Horizontal
            Layout.fillWidth: true
        }
    }

    Section {
        objectName: "containers.tabs"
        title: "TabBar"

        TabBar {
            id: tabs
            Layout.fillWidth: true

            TabButton {
                text: "One"
            }

            TabButton {
                text: "Two"
            }

            TabButton {
                text: "Three"
            }
        }

        StackLayout {
            currentIndex: tabs.currentIndex
            Layout.fillWidth: true
            Layout.preferredHeight: 40

            Label {
                text: "First tab"
            }

            Label {
                text: "Second tab"
            }

            Label {
                text: "Third tab"
            }
        }

        PageIndicator {
            count: 3
            currentIndex: tabs.currentIndex
            Layout.alignment: Qt.AlignHCenter
        }
    }

    Section {
        objectName: "containers.stack"
        title: "StackView"

        StackView {
            id: stack
            initialItem: stackPage
            Layout.fillWidth: true
            Layout.preferredHeight: 90
        }

        RowLayout {
            spacing: 8
            Layout.fillWidth: true

            Button {
                text: "Push"
                Layout.fillWidth: true
                onClicked: stack.push(stackPage)
            }

            Button {
                text: "Pop"
                enabled: stack.depth > 1
                Layout.fillWidth: true
                onClicked: stack.pop()
            }
        }
    }

    Section {
        objectName: "containers.swipe"
        title: "SwipeView"

        SwipeView {
            id: swipe
            Layout.fillWidth: true
            Layout.preferredHeight: 90

            Repeater {
                model: 3

                delegate: Pane {
                    required property int index

                    padding: 8

                    Label {
                        anchors.centerIn: parent
                        text: "Page " + (index + 1)
                    }
                }
            }
        }

        PageIndicator {
            count: swipe.count
            currentIndex: swipe.currentIndex
            interactive: true
            Layout.alignment: Qt.AlignHCenter
        }
    }

    Section {
        objectName: "containers.split"
        title: "SplitView"

        SplitView {
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.preferredHeight: 80

            Pane {
                padding: 8
                SplitView.minimumWidth: 70
                SplitView.preferredWidth: 160

                Label {
                    anchors.centerIn: parent
                    text: "Left"
                }
            }

            Pane {
                padding: 8
                SplitView.fillWidth: true

                Label {
                    anchors.centerIn: parent
                    text: "Right"
                }
            }
        }

        SplitView {
            orientation: Qt.Vertical
            Layout.fillWidth: true
            Layout.preferredHeight: 120

            Pane {
                padding: 8
                SplitView.minimumHeight: 30
                SplitView.preferredHeight: 50

                Label {
                    anchors.centerIn: parent
                    text: "Top"
                }
            }

            Pane {
                padding: 8
                SplitView.fillHeight: true

                Label {
                    anchors.centerIn: parent
                    text: "Bottom"
                }
            }
        }
    }

    Section {
        objectName: "containers.scroll"
        title: "ScrollView"

        ScrollView {
            Layout.fillWidth: true
            Layout.preferredHeight: 212

            Flickable {
                boundsBehavior: Flickable.StopAtBounds

                TextArea.flickable: TextArea {
                    text: "Scrollable text.\n".repeat(30)
                }
            }
        }
    }
}
