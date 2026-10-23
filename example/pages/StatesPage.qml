// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    id: root

    readonly property var states: [
        {title: "Normal"},
        {title: "Pressed", down: true},
        {title: "Checked", checked: true},
        {title: "Checked, pressed", checked: true, down: true},
        {title: "Highlighted", highlighted: true},
        {title: "Disabled", enabled: false},
        {title: "Disabled, checked", enabled: false, checked: true}
    ]
    readonly property int cellWidth: 112

    title: "States"
    subtitle: "Every button-like control in forced states. Pressed is set through down, so it stays visible without any input."
    minColumnWidth: 100000

    Section {
        objectName: "states.matrix"
        title: "State matrix"

        RowLayout {
            spacing: 8

            Item {
                Layout.preferredWidth: root.cellWidth
            }

            Repeater {
                model: root.states

                delegate: Label {
                    required property var modelData

                    text: modelData.title
                    elide: Text.ElideRight
                    Layout.preferredWidth: root.cellWidth
                }
            }
        }

        StateRow {
            name: "Button"
            states: root.states
            cellWidth: root.cellWidth
            control: Button {
                text: "Button"
            }
        }

        StateRow {
            name: "Button, flat"
            states: root.states
            cellWidth: root.cellWidth
            control: Button {
                text: "Flat"
                flat: true
            }
        }

        StateRow {
            name: "DelayButton"
            states: root.states
            cellWidth: root.cellWidth
            control: DelayButton {
                text: "Delay"
            }
        }

        StateRow {
            name: "RoundButton"
            states: root.states
            cellWidth: root.cellWidth
            control: RoundButton {
                text: "★"
            }
        }

        StateRow {
            name: "ToolButton"
            states: root.states
            cellWidth: root.cellWidth
            control: ToolButton {
                text: "Tool"
            }
        }

        StateRow {
            name: "TabButton"
            states: root.states
            cellWidth: root.cellWidth
            control: TabButton {
                text: "Tab"
            }
        }

        StateRow {
            name: "MenuBarItem"
            states: root.states
            cellWidth: root.cellWidth
            control: MenuBarItem {
                text: "File"
            }
        }

        StateRow {
            name: "CheckBox"
            states: root.states
            cellWidth: root.cellWidth
            control: CheckBox {
                text: "Text"
            }
        }

        StateRow {
            name: "RadioButton"
            states: root.states
            cellWidth: root.cellWidth
            control: RadioButton {
                text: "Text"
                autoExclusive: false
            }
        }

        StateRow {
            name: "Switch"
            states: root.states
            cellWidth: root.cellWidth
            control: Switch {
                text: "Text"
            }
        }

        StateRow {
            name: "ItemDelegate"
            states: root.states
            cellWidth: root.cellWidth
            control: ItemDelegate {
                text: "Item"
            }
        }

        StateRow {
            name: "CheckDelegate"
            states: root.states
            cellWidth: root.cellWidth
            control: CheckDelegate {
                text: "Item"
            }
        }

        StateRow {
            name: "RadioDelegate"
            states: root.states
            cellWidth: root.cellWidth
            control: RadioDelegate {
                text: "Item"
                autoExclusive: false
            }
        }

        StateRow {
            name: "SwitchDelegate"
            states: root.states
            cellWidth: root.cellWidth
            control: SwitchDelegate {
                text: "Item"
            }
        }
    }

    Section {
        objectName: "states.fields"
        title: "Fields"

        GridLayout {
            columns: 4
            rowSpacing: 8
            columnSpacing: 8
            Layout.fillWidth: true

            Label {
                text: "Placeholder"
            }

            Label {
                text: "Text"
            }

            Label {
                text: "Read-only"
            }

            Label {
                text: "Disabled"
            }

            TextField {
                placeholderText: "TextField"
                Layout.fillWidth: true
            }

            TextField {
                text: "TextField"
                Layout.fillWidth: true
            }

            TextField {
                text: "TextField"
                readOnly: true
                Layout.fillWidth: true
            }

            TextField {
                text: "TextField"
                enabled: false
                Layout.fillWidth: true
            }

            ComboBox {
                model: ["ComboBox"]
                Layout.fillWidth: true
            }

            ComboBox {
                model: ["Editable"]
                editable: true
                Layout.fillWidth: true
            }

            ComboBox {
                model: ["Pressed"]
                down: true
                Layout.fillWidth: true
            }

            ComboBox {
                model: ["ComboBox"]
                enabled: false
                Layout.fillWidth: true
            }

            SpinBox {
                value: 5
                Layout.fillWidth: true
            }

            SpinBox {
                value: 5
                editable: true
                Layout.fillWidth: true
            }

            SpinBox {
                value: 0
                Layout.fillWidth: true
            }

            SpinBox {
                value: 5
                enabled: false
                Layout.fillWidth: true
            }
        }
    }
}
