// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    id: root

    readonly property alias popup: popup
    readonly property alias dialog: dialog
    readonly property alias drawer: drawer
    readonly property alias menu: menu
    readonly property alias tooltip: tooltip

    title: "Popups"
    subtitle: "Popup, Dialog, Drawer, menus and tooltips."

    Action {
        id: openAction
        text: "Open"
        shortcut: StandardKey.Open
    }

    Menu {
        id: menu

        MenuItem {
            action: openAction
        }

        MenuItem {
            text: "Autosave"
            checkable: true
            checked: true
        }

        MenuItem {
            text: "Unavailable"
            enabled: false
        }

        MenuSeparator {}

        Menu {
            title: "Submenu"

            MenuItem {
                text: "Item 1"
            }

            MenuItem {
                text: "A very very very long item 2"
            }
        }
    }

    Popup {
        id: popup
        objectName: "popup"
        parent: Overlay.overlay
        anchors.centerIn: parent
        padding: 8

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            Label {
                text: "Popup"
            }

            Button {
                text: "Close"
                Layout.alignment: Qt.AlignRight
                onClicked: popup.close()
            }
        }
    }

    Dialog {
        id: dialog
        objectName: "dialog"
        title: "Dialog"
        parent: Overlay.overlay
        anchors.centerIn: parent
        padding: 10
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        Label {
            text: "Confirm the action?"
        }
    }

    Drawer {
        id: drawer
        objectName: "drawer"
        width: 280
        height: root.Window.height
        padding: 8

        ColumnLayout {
            anchors.fill: parent
            spacing: 4

            Label {
                text: "Drawer"
            }

            Repeater {
                model: ["Inbox", "Starred", "Archive"]

                delegate: ItemDelegate {
                    required property int index
                    required property string modelData

                    text: modelData
                    highlighted: index === 0
                    Layout.fillWidth: true
                    onClicked: drawer.close()
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    Section {
        objectName: "popups.open"
        title: "Open a popup"

        Flow {
            spacing: 6
            Layout.fillWidth: true

            Button {
                text: "Popup"
                onClicked: popup.open()
            }

            Button {
                text: "Dialog"
                onClicked: dialog.open()
            }

            Button {
                text: "Drawer"
                onClicked: drawer.open()
            }

            Button {
                id: menuButton
                text: "Menu"
                onClicked: menu.popup(menuButton, 0, menuButton.height)
            }
        }
    }

    Section {
        objectName: "popups.tooltips"
        title: "ToolTips"

        Flow {
            spacing: 6
            Layout.fillWidth: true

            ToolButton {
                text: "?"
                ToolTip.visible: hovered
                ToolTip.text: "ToolTip"
            }

            Button {
                text: "Button"
                ToolTip.visible: pressed
                ToolTip.text: "ToolTip"
            }

            Button {
                text: "Show for 2 s"
                onClicked: tooltip.show("Shown programmatically", 2000)

                ToolTip {
                    id: tooltip
                }
            }
        }
    }

    Section {
        objectName: "popups.context"
        title: "ContextMenu"

        Frame {
            padding: 8
            Layout.fillWidth: true
            Layout.preferredHeight: 100

            ContextMenu.menu: Menu {
                MenuItem {
                    text: "Copy"
                }

                MenuItem {
                    text: "Paste"
                }

                MenuSeparator {}

                Menu {
                    title: "More"

                    MenuItem {
                        text: "Select all"
                    }
                }
            }
        }
    }
}
