// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Qt.labs.qmlmodels
import "../components"

ExamplePage {
    title: "Lists"
    subtitle: "Delegates, list views, tables and trees."

    ListModel {
        id: columnHeaders

        ListElement {
            display: "Name"
        }

        ListElement {
            display: "Role"
        }

        ListElement {
            display: "Team"
        }

        ListElement {
            display: "City"
        }

        ListElement {
            display: "Age"
        }

        ListElement {
            display: "Joined"
        }
    }

    TableModel {
        id: tableModel

        TableModelColumn {
            display: "name"
            edit: "name"
        }

        TableModelColumn {
            display: "role"
            edit: "role"
        }

        TableModelColumn {
            display: "team"
            edit: "team"
        }

        TableModelColumn {
            display: "city"
            edit: "city"
        }

        TableModelColumn {
            display: "age"
            edit: "age"
        }

        TableModelColumn {
            display: "joined"
            edit: "joined"
        }

        rows: [
            {name: "Anna", role: "Designer", team: "Core", city: "Moscow", age: "28", joined: "2019-04"},
            {name: "Boris", role: "Engineer", team: "Platform", city: "Kazan", age: "35", joined: "2016-09"},
            {name: "Vera", role: "Manager", team: "Core", city: "Omsk", age: "41", joined: "2014-02"},
            {name: "Gleb", role: "Engineer", team: "Mobile", city: "Tver", age: "23", joined: "2023-07"},
            {name: "Daria", role: "QA", team: "Platform", city: "Samara", age: "31", joined: "2020-11"},
            {name: "Egor", role: "Engineer", team: "Core", city: "Perm", age: "29", joined: "2021-01"},
            {name: "Zhanna", role: "Analyst", team: "Data", city: "Sochi", age: "37", joined: "2017-05"},
            {name: "Ivan", role: "Engineer", team: "Data", city: "Tula", age: "26", joined: "2022-03"},
            {name: "Kira", role: "Designer", team: "Mobile", city: "Ufa", age: "33", joined: "2018-08"},
            {name: "Lev", role: "DevOps", team: "Platform", city: "Kursk", age: "39", joined: "2015-12"},
            {name: "Maria", role: "Engineer", team: "Mobile", city: "Izhevsk", age: "27", joined: "2022-10"},
            {name: "Nikita", role: "QA", team: "Core", city: "Vologda", age: "30", joined: "2020-06"},
            {name: "Olga", role: "Manager", team: "Data", city: "Kaluga", age: "44", joined: "2012-01"},
            {name: "Pavel", role: "Engineer", team: "Platform", city: "Murmansk", age: "32", joined: "2019-09"},
            {name: "Raisa", role: "Analyst", team: "Core", city: "Tomsk", age: "25", joined: "2023-02"},
            {name: "Semyon", role: "DevOps", team: "Data", city: "Chita", age: "36", joined: "2016-04"},
            {name: "Tatiana", role: "Engineer", team: "Core", city: "Penza", age: "34", joined: "2018-03"},
            {name: "Fyodor", role: "Designer", team: "Platform", city: "Yakutsk", age: "40", joined: "2013-10"},
            {name: "Yulia", role: "QA", team: "Mobile", city: "Irkutsk", age: "24", joined: "2024-05"},
            {name: "Yaroslav", role: "Engineer", team: "Data", city: "Kostroma", age: "38", joined: "2015-07"}
        ]
    }

    TreeModel {
        id: treeModel

        TableModelColumn {
            display: "name"
            edit: "name"
        }

        TableModelColumn {
            display: "size"
        }

        TableModelColumn {
            display: "modified"
        }

        rows: [
            {
                name: "example",
                size: "3 items",
                modified: "2026.10.18-22:16:37",
                rows: [
                    {
                        name: "components",
                        size: "3 items",
                        modified: "2026.10.18-16:37:08",
                        rows: [
                            {name: "ExamplePage.qml", size: "1.3 KB", modified: "2026.10.18-16:17:14"},
                            {name: "Section.qml", size: "280 B", modified: "2026.10.18-16:17:14"},
                            {name: "StateRow.qml", size: "1.3 KB", modified: "2026.10.18-16:17:31"}
                        ]
                    },
                    {
                        name: "pages",
                        size: "8 items",
                        modified: "2026.10.19-21:43:36",
                        rows: [
                            {name: "ButtonsPage.qml", size: "5.3 KB", modified: "2026.10.19-21:29:44"},
                            {name: "ContainersPage.qml", size: "5.9 KB", modified: "2026.10.18-16:37:12"},
                            {name: "CursorsPage.qml", size: "3.2 KB", modified: "2026.10.18-16:37:12"},
                            {name: "InputPage.qml", size: "4.5 KB", modified: "2026.10.18-16:37:12"},
                            {name: "ListsPage.qml", size: "16.4 KB", modified: "2026.10.19-21:43:36"},
                            {name: "PopupsPage.qml", size: "4.6 KB", modified: "2026.10.19-21:29:44"},
                            {name: "StatesPage.qml", size: "6.2 KB", modified: "2026.10.18-22:19:32"},
                            {name: "ValuesPage.qml", size: "3.1 KB", modified: "2026.10.18-16:37:12"}
                        ]
                    },
                    {name: "Example.qml", size: "6.3 KB", modified: "2026.10.18-22:16:37"}
                ]
            },
            {
                name: "qml",
                size: "63 items",
                modified: "2026.10.19-21:34:46",
                rows: [
                    {
                        name: "util",
                        size: "14 items",
                        modified: "2026.10.18-23:26:55",
                        rows: [
                            {name: "ButtonBackground.qml", size: "1.3 KB", modified: "2026.10.18-19:41:19"},
                            {name: "Caret.qml", size: "726 B", modified: "2026.10.13-00:09:12"},
                            {name: "Check.qml", size: "694 B", modified: "2026.10.15-15:05:43"},
                            {name: "CheckIndicator.qml", size: "1.4 KB", modified: "2026.10.18-22:08:23"},
                            {name: "Chevron.qml", size: "697 B", modified: "2026.10.15-15:05:47"},
                            {name: "FieldBackground.qml", size: "828 B", modified: "2026.10.18-18:56:40"},
                            {name: "FocusRing.qml", size: "216 B", modified: "2026.10.12-21:34:58"},
                            {name: "PlusMinus.qml", size: "470 B", modified: "2026.10.12-21:34:58"},
                            {name: "RadioIndicator.qml", size: "972 B", modified: "2026.10.18-19:31:29"},
                            {name: "Separator.qml", size: "757 B", modified: "2026.10.18-23:31:31"},
                            {name: "SliderHandle.qml", size: "723 B", modified: "2026.10.15-15:06:29"},
                            {name: "StateBackground.qml", size: "1.2 KB", modified: "2026.10.18-19:41:19"},
                            {name: "SwitchIndicator.qml", size: "1.2 KB", modified: "2026.10.18-22:09:31"},
                            {name: "TextEditingContextMenu.qml", size: "698 B", modified: "2026.10.15-14:47:37"}
                        ]
                    },
                    {name: "ApplicationWindow.qml", size: "800 B", modified: "2026.10.18-18:56:40"},
                    {name: "BusyIndicator.qml", size: "2.2 KB", modified: "2026.10.15-15:05:03"},
                    {name: "Button.qml", size: "1.5 KB", modified: "2026.10.19-19:32:24"},
                    {name: "CheckBox.qml", size: "1.4 KB", modified: "2026.10.19-19:30:44"},
                    {name: "CheckDelegate.qml", size: "1.9 KB", modified: "2026.10.19-19:30:44"},
                    {name: "ComboBox.qml", size: "5.5 KB", modified: "2026.10.19-19:49:14"},
                    {name: "DayOfWeekRow.qml", size: "1019 B", modified: "2026.10.19-20:03:39"},
                    {name: "DelayButton.qml", size: "3.8 KB", modified: "2026.10.19-19:30:44"},
                    {name: "Dial.qml", size: "3.4 KB", modified: "2026.10.19-19:56:31"},
                    {name: "Dialog.qml", size: "2.2 KB", modified: "2026.10.18-20:02:30"},
                    {name: "DialogButtonBox.qml", size: "900 B", modified: "2026.10.12-21:34:58"},
                    {name: "DoubleSpinBox.qml", size: "2.8 KB", modified: "2026.10.19-19:49:14"},
                    {name: "Drawer.qml", size: "1.5 KB", modified: "2026.10.13-00:09:12"},
                    {name: "Frame.qml", size: "510 B", modified: "2026.10.12-21:34:58"},
                    {name: "GroupBox.qml", size: "1.1 KB", modified: "2026.10.12-21:34:58"},
                    {name: "HorizontalHeaderView.qml", size: "276 B", modified: "2026.10.19-21:00:04"},
                    {name: "HorizontalHeaderViewDelegate.qml", size: "1.2 KB", modified: "2026.10.19-21:03:02"},
                    {name: "ItemDelegate.qml", size: "1.4 KB", modified: "2026.10.19-19:30:44"},
                    {name: "Label.qml", size: "144 B", modified: "2026.10.18-18:56:40"},
                    {name: "Menu.qml", size: "4.0 KB", modified: "2026.10.19-19:21:01"},
                    {name: "MenuBar.qml", size: "772 B", modified: "2026.10.18-20:02:30"},
                    {name: "MenuBarItem.qml", size: "1.2 KB", modified: "2026.10.19-19:30:44"},
                    {name: "MenuItem.qml", size: "4.2 KB", modified: "2026.10.19-19:30:44"},
                    {name: "MenuSeparator.qml", size: "676 B", modified: "2026.10.19-19:10:09"},
                    {name: "MonthGrid.qml", size: "1.8 KB", modified: "2026.10.19-20:03:39"},
                    {name: "Page.qml", size: "652 B", modified: "2026.10.12-21:34:58"},
                    {name: "PageIndicator.qml", size: "1.4 KB", modified: "2026.10.19-19:30:44"},
                    {name: "Pane.qml", size: "444 B", modified: "2026.10.12-21:34:58"},
                    {name: "Popup.qml", size: "1.2 KB", modified: "2026.10.13-00:09:05"},
                    {name: "ProgressBar.qml", size: "2.5 KB", modified: "2026.10.19-19:23:14"},
                    {name: "RadioButton.qml", size: "1.4 KB", modified: "2026.10.19-19:30:44"},
                    {name: "RadioDelegate.qml", size: "1.9 KB", modified: "2026.10.19-19:30:44"},
                    {name: "RangeSlider.qml", size: "4.5 KB", modified: "2026.10.19-19:42:37"},
                    {name: "RoundButton.qml", size: "1.6 KB", modified: "2026.10.19-19:30:44"},
                    {name: "ScrollBar.qml", size: "1.8 KB", modified: "2026.10.19-19:30:44"},
                    {name: "ScrollIndicator.qml", size: "1.2 KB", modified: "2026.10.13-00:09:12"},
                    {name: "ScrollView.qml", size: "899 B", modified: "2026.10.12-21:34:58"},
                    {name: "SearchField.qml", size: "8.8 KB", modified: "2026.10.19-19:30:44"},
                    {name: "SelectionRectangle.qml", size: "541 B", modified: "2026.10.19-20:02:56"},
                    {name: "Slider.qml", size: "3.4 KB", modified: "2026.10.19-19:42:37"},
                    {name: "SpinBox.qml", size: "2.7 KB", modified: "2026.10.19-19:49:14"},
                    {name: "SplitView.qml", size: "1014 B", modified: "2026.10.18-23:31:51"},
                    {name: "StackView.qml", size: "2.3 KB", modified: "2026.10.15-15:05:38"},
                    {name: "SwipeDelegate.qml", size: "1.7 KB", modified: "2026.10.19-19:49:14"},
                    {name: "SwipeView.qml", size: "973 B", modified: "2026.10.13-00:09:12"},
                    {name: "Switch.qml", size: "1.4 KB", modified: "2026.10.19-19:30:44"},
                    {name: "SwitchDelegate.qml", size: "1.9 KB", modified: "2026.10.19-19:30:44"},
                    {name: "TabBar.qml", size: "1.1 KB", modified: "2026.10.12-21:34:58"},
                    {name: "TabButton.qml", size: "1.9 KB", modified: "2026.10.19-19:56:31"},
                    {name: "TableViewDelegate.qml", size: "2.3 KB", modified: "2026.10.19-20:44:52"},
                    {name: "TextArea.qml", size: "1.7 KB", modified: "2026.10.18-20:08:39"},
                    {name: "TextField.qml", size: "1.6 KB", modified: "2026.10.18-20:08:39"},
                    {name: "Theme.qml", size: "2.8 KB", modified: "2026.10.18-20:21:41"},
                    {name: "ToolBar.qml", size: "681 B", modified: "2026.10.18-20:02:30"},
                    {name: "ToolButton.qml", size: "1.5 KB", modified: "2026.10.19-19:30:44"},
                    {name: "ToolSeparator.qml", size: "621 B", modified: "2026.10.12-21:34:58"},
                    {name: "ToolTip.qml", size: "1.2 KB", modified: "2026.10.18-20:08:39"},
                    {name: "TreeViewDelegate.qml", size: "3.5 KB", modified: "2026.10.19-21:34:46"},
                    {name: "Tumbler.qml", size: "2.3 KB", modified: "2026.10.19-19:48:51"},
                    {name: "VerticalHeaderView.qml", size: "272 B", modified: "2026.10.19-21:00:04"},
                    {name: "VerticalHeaderViewDelegate.qml", size: "1.2 KB", modified: "2026.10.19-21:03:02"},
                    {name: "WeekNumberColumn.qml", size: "993 B", modified: "2026.10.19-20:03:39"}
                ]
            },
            {name: ".gitignore", size: "178 B", modified: "2026.10.15-04:02:56"},
            {name: "CLAUDE.md", size: "12.4 KB", modified: "2026.10.19-21:35:07"},
            {name: "CMakeLists.txt", size: "1.6 KB", modified: "2026.10.15-04:02:56"},
            {name: "install-run.sh", size: "291 B", modified: "2026.10.18-16:37:12"},
            {name: "LICENSE", size: "34.3 KB", modified: "2026.10.15-04:02:56"},
            {name: "run.sh", size: "273 B", modified: "2026.10.18-16:37:12"}
        ]
    }

    Section {
        objectName: "lists.delegates"
        title: "Delegates"

        ItemDelegate {
            text: "ItemDelegate"
            Layout.fillWidth: true
        }

        ItemDelegate {
            text: "Highlighted"
            highlighted: true
            Layout.fillWidth: true
        }

        ItemDelegate {
            text: "Disabled"
            enabled: false
            Layout.fillWidth: true
        }

        CheckDelegate {
            text: "CheckDelegate"
            checked: true
            Layout.fillWidth: true
        }

        RadioDelegate {
            text: "RadioDelegate A"
            checked: true
            Layout.fillWidth: true
        }

        RadioDelegate {
            text: "RadioDelegate B"
            Layout.fillWidth: true
        }

        SwitchDelegate {
            text: "SwitchDelegate"
            checked: true
            Layout.fillWidth: true
        }

        SwitchDelegate {
            text: "Disabled"
            enabled: false
            Layout.fillWidth: true
        }

        SwipeDelegate {
            id: swipeDelegate
            text: "SwipeDelegate"
            Layout.fillWidth: true

            onClicked: {
                if(swipeDelegate.swipe.position !== 0) {
                    swipeDelegate.swipe.close()
                }
            }

            swipe.left: Button {
                text: "Archive"
                height: parent.height
                anchors.left: parent.left
                onClicked: swipeDelegate.swipe.close()
            }

            swipe.right: Button {
                text: "Delete"
                height: parent.height
                anchors.right: parent.right
                onClicked: swipeDelegate.swipe.close()
            }
        }
    }

    Section {
        objectName: "lists.scrolling"
        title: "ListView with ScrollBar and ScrollIndicator"

        RowLayout {
            spacing: 8
            Layout.fillWidth: true

            ListView {
                spacing: 4
                boundsBehavior: Flickable.StopAtBounds
                model: 20
                layer.enabled: true
                layer.effect: ListClip {}
                Layout.fillWidth: true
                Layout.preferredHeight: 440

                delegate: ItemDelegate {
                    required property int index

                    width: ListView.view.width
                    text: "Item " + (index + 1)
                    highlighted: index === 1
                }

                ScrollBar.vertical: ScrollBar {}
            }

            ListView {
                spacing: 4
                boundsBehavior: Flickable.StopAtBounds
                model: 20
                layer.enabled: true
                layer.effect: ListClip {}
                Layout.fillWidth: true
                Layout.preferredHeight: 440

                delegate: ItemDelegate {
                    required property int index

                    width: ListView.view.width
                    text: "Row " + (index + 1)
                }

                ScrollIndicator.vertical: ScrollIndicator {}
            }
        }
    }

    Section {
        objectName: "lists.tree"
        title: "TreeView"

        TreeView {
            id: tree
            boundsBehavior: Flickable.StopAtBounds
            layer.enabled: true
            layer.effect: ListClip {}
            model: treeModel
            selectionModel: ItemSelectionModel {}
            delegate: TreeViewDelegate {}
            columnWidthProvider: column => [320, 100, 180][column]
            Layout.fillWidth: true
            Layout.preferredHeight: 400

            Component.onCompleted: expandRecursively(-1, 1)

            ScrollBar.vertical: ScrollBar {}
        }
    }

    Section {
        objectName: "lists.table"
        title: "TableView with headers"
        Layout.columnSpan: parent.columns

        Frame {
            padding: 8
            Layout.fillWidth: true
            Layout.maximumWidth: leftPadding + rightPadding + verticalHeader.width + table.contentWidth
            Layout.preferredHeight: topPadding + bottomPadding + horizontalHeader.height + Math.min(table.contentHeight, 400)

            Item {
                anchors.fill: parent
                layer.enabled: true
                layer.effect: ListClip {}

                HorizontalHeaderView {
                    id: horizontalHeader
                    anchors.left: table.left
                    anchors.top: parent.top
                    syncView: table
                    model: columnHeaders
                    delegate: HorizontalHeaderViewDelegate {}
                }

                VerticalHeaderView {
                    id: verticalHeader
                    anchors.top: table.top
                    anchors.left: parent.left
                    syncView: table
                    columnWidthProvider: () => 40
                    delegate: VerticalHeaderViewDelegate {}
                }

                TableView {
                    id: table
                    anchors.fill: parent
                    anchors.topMargin: horizontalHeader.height
                    anchors.leftMargin: verticalHeader.width
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds

                    model: tableModel
                    selectionModel: ItemSelectionModel {}
                    delegate: TableViewDelegate {}
                    columnWidthProvider: column => [100, 100, 100, 110, 60, 100][column]

                    ScrollBar.vertical: ScrollBar {}
                    ScrollBar.horizontal: ScrollBar {}

                    SelectionRectangle {
                        target: table
                    }
                }
            }
        }
    }
}
