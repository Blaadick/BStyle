// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    title: "Input"
    subtitle: "Text fields, search, numbers, choice and calendar."

    Section {
        objectName: "input.text"
        title: "Text"

        TextField {
            placeholderText: "Text field"
            Layout.fillWidth: true
        }

        TextField {
            text: "With text"
            Layout.fillWidth: true
        }

        TextField {
            placeholderText: "Password"
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        TextField {
            text: "Disabled"
            enabled: false
            Layout.fillWidth: true
        }

        TextArea {
            placeholderText: "Multi-line text area"
            Layout.fillWidth: true
            Layout.preferredHeight: 80
        }
    }

    Section {
        objectName: "input.search"
        title: "Search"

        SearchField {
            placeholderText: "Search"
            suggestionModel: ["Suggestion 1", "Suggestion 2", "Suggestion 3", "Suggestion 4"]
            Layout.fillWidth: true
        }

        SearchField {
            text: "With text"
            Layout.fillWidth: true
        }

        SearchField {
            text: "Disabled"
            enabled: false
            Layout.fillWidth: true
        }
    }

    Section {
        objectName: "input.numbers"
        title: "Numbers"

        SpinBox {
            value: 42
            editable: true
            Layout.fillWidth: true
        }

        SpinBox {
            value: 7
            enabled: false
            Layout.fillWidth: true
        }

        DoubleSpinBox {
            from: 0
            to: 100
            value: 1.5
            stepSize: 0.25
            editable: true
            Layout.fillWidth: true
        }

        DoubleSpinBox {
            value: 7.5
            enabled: false
            Layout.fillWidth: true
        }
    }

    Section {
        objectName: "input.choice"
        title: "Choice"

        ComboBox {
            model: ["First", "Second", "Third"]
            Layout.fillWidth: true
        }

        ComboBox {
            model: ["Editable", "List"]
            editable: true
            Layout.fillWidth: true
        }

        ComboBox {
            model: ["Disabled"]
            enabled: false
            Layout.fillWidth: true
        }
    }

    Section {
        objectName: "input.calendar"
        title: "Calendar"

        GridLayout {
            columns: 2
            rowSpacing: 4
            columnSpacing: 4
            Layout.fillWidth: true

            DayOfWeekRow {
                locale: monthGrid.locale
                Layout.column: 1
                Layout.fillWidth: true
            }

            WeekNumberColumn {
                month: monthGrid.month
                year: monthGrid.year
                locale: monthGrid.locale
                Layout.fillHeight: true
            }

            MonthGrid {
                id: monthGrid
                month: Calendar.January
                year: 2026
                locale: Qt.locale("en_US")
                Layout.fillWidth: true
                Layout.fillHeight: true

                onClicked: date => selectedDate.text = "Selected: " + date.toDateString()
            }
        }

        Label {
            id: selectedDate
            text: "Selected: none"
        }
    }

    Section {
        objectName: "input.months"
        title: "Month browser"

        ListView {
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            layer.enabled: true
            layer.effect: ListClip {}
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.StrictlyEnforceRange
            Layout.fillWidth: true
            Layout.preferredHeight: 240

            model: CalendarModel {
                from: new Date(2026, Calendar.January, 1)
                to: new Date(2026, Calendar.December, 31)
            }

            delegate: ColumnLayout {
                required property var model

                spacing: 6
                width: ListView.view.width
                height: ListView.view.height

                Label {
                    text: grid.title
                    Layout.alignment: Qt.AlignHCenter
                }

                MonthGrid {
                    id: grid
                    month: model.month
                    year: model.year
                    locale: Qt.locale("en_US")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}
