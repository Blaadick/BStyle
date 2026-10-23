// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"
import "pages"

ApplicationWindow {
    id: win

    readonly property var pages: [
        {name: "buttons", title: "Buttons"},
        {name: "states", title: "States"},
        {name: "input", title: "Input"},
        {name: "values", title: "Values"},
        {name: "lists", title: "Lists"},
        {name: "containers", title: "Containers"},
        {name: "popups", title: "Popups"},
        {name: "cursors", title: "Cursors"}
    ]
    property string page: "buttons"
    readonly property int pageIndex: Math.max(0, pages.findIndex(p => p.name === page))
    readonly property Item currentPage: pageStack.children[pageIndex] ?? null
    readonly property alias popups: popupsPage
    readonly property bool dark: Qt.styleHints.colorScheme === Qt.ColorScheme.Dark

    function argument(name) {
        const args = Qt.application.arguments
        const i = args.indexOf(name)
        return i >= 0 && i + 1 < args.length ? args[i + 1] : ""
    }

    function setDark(value) {
        Qt.styleHints.colorScheme = value ? Qt.ColorScheme.Dark : Qt.ColorScheme.Light
    }

    function fitToPage() {
        height = Math.ceil(height - currentPage.height + currentPage.contentHeight)
    }

    function describe(item) {
        if(!item || String(item).startsWith("QQuickRootItem"))
            return "none"
        const type = String(item).replace(/_QMLTYPE_\d+/, "").replace(/\(.*$/, "")
        return item.objectName ? type + " #" + item.objectName : type
    }

    width: 1280
    height: 860
    visible: true
    title: "BStyle"

    Component.onCompleted: {
        const p = argument("--page")
        if(p)
            page = p
        const s = argument("--scheme")
        if(s)
            setDark(s === "dark")
    }

    Action {
        id: openAction
        text: "Open"
        shortcut: StandardKey.Open
    }

    Action {
        id: saveAction
        text: "Save"
        shortcut: StandardKey.Save
    }

    Action {
        id: exitAction
        text: "Exit"
        enabled: false
    }

    Action {
        id: undoAction
        text: "Undo"
        shortcut: StandardKey.Undo
    }

    Action {
        id: redoAction
        text: "Redo"
        shortcut: StandardKey.Redo
        enabled: false
    }

    Action {
        id: sidebarAction
        text: "Sidebar"
        checkable: true
        checked: true
    }

    Action {
        id: darkAction
        text: "Dark"
        checkable: true
        checked: win.dark
        onTriggered: win.setDark(checked)
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"

            MenuItem {
                action: openAction
            }

            MenuItem {
                action: saveAction
            }

            MenuSeparator {}

            MenuItem {
                action: exitAction
            }
        }

        Menu {
            title: "&Edit"

            MenuItem {
                action: undoAction
            }

            MenuItem {
                action: redoAction
            }
        }

        Menu {
            title: "&View"

            MenuItem {
                action: sidebarAction
            }

            MenuItem {
                action: darkAction
            }
        }
    }

    header: ToolBar {
        padding: 4

        RowLayout {
            anchors.fill: parent
            spacing: 4

            ToolButton {
                text: "☰"
                action: sidebarAction
                display: AbstractButton.TextOnly
            }

            ToolSeparator {}

            ToolButton {
                action: openAction
            }

            ToolButton {
                action: saveAction
            }

            Label {
                text: win.pages[win.pageIndex].title
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }

            Switch {
                text: "Dark"
                checked: win.dark
                onToggled: win.setDark(checked)
            }

            ToolButton {
                id: moreButton
                text: "⋮"
                onClicked: popupsPage.menu.popup(moreButton, moreButton.width - popupsPage.menu.width, moreButton.height)
            }
        }
    }

    footer: ToolBar {
        padding: 4

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Label {
                text: "Page: " + win.page
            }

            Label {
                text: "Scheme: " + (win.dark ? "dark" : "light")
            }

            Label {
                text: "Focus: " + win.describe(win.activeFocusItem)
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Pane {
            padding: 8
            visible: sidebarAction.checked
            Layout.fillHeight: true
            Layout.preferredWidth: 220

            ListView {
                anchors.fill: parent
                spacing: 4
                boundsBehavior: Flickable.StopAtBounds
                model: win.pages
                layer.enabled: true
                layer.effect: ListClip {}

                delegate: ItemDelegate {
                    required property var modelData

                    width: ListView.view.width
                    text: modelData.title
                    highlighted: win.page === modelData.name
                    onClicked: win.page = modelData.name
                }
            }
        }

        StackLayout {
            id: pageStack
            currentIndex: win.pageIndex
            Layout.fillWidth: true
            Layout.fillHeight: true

            ButtonsPage {
                objectName: "buttons"
            }

            StatesPage {
                objectName: "states"
            }

            InputPage {
                objectName: "input"
            }

            ValuesPage {
                objectName: "values"
            }

            ListsPage {
                objectName: "lists"
            }

            ContainersPage {
                objectName: "containers"
            }

            PopupsPage {
                id: popupsPage
                objectName: "popups"
            }

            CursorsPage {
                objectName: "cursors"
            }
        }
    }
}
