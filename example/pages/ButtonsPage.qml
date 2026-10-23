// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    title: "Buttons"
    subtitle: "Push buttons, toggles and button groups."

    ActionGroup {
        id: viewGroup

        Action {
            id: listViewAction
            text: "List view"
            checkable: true
            checked: true
        }

        Action {
            id: gridViewAction
            text: "Grid view"
            checkable: true
        }
    }

    ButtonGroup {
        id: alignGroup
    }

    ButtonGroup {
        id: childGroup
        exclusive: false
        checkState: parentBox.checkState
    }

    Section {
        objectName: "buttons.push"
        title: "Push buttons"

        Flow {
            spacing: 6
            Layout.fillWidth: true

            Button {
                text: "Regular"
            }

            Button {
                text: "Highlighted"
                highlighted: true
            }

            Button {
                text: "Flat"
                flat: true
            }

            Button {
                text: "Checked"
                checkable: true
                checked: true
            }

            Button {
                text: "Disabled"
                enabled: false
            }
        }

        Label {
            text: "Delay buttons"
        }

        Flow {
            spacing: 6
            Layout.fillWidth: true

            DelayButton {
                text: "DelayButton"
                delay: 2000
            }

            DelayButton {
                text: "Disabled"
                enabled: false
            }
        }
    }

    Section {
        objectName: "buttons.compact"
        title: "Round and tool buttons"

        Label {
            text: "RoundButton"
        }

        RowLayout {
            spacing: 6

            RoundButton {
                text: "+"
            }

            RoundButton {
                text: "★"
                checkable: true
                checked: true
            }

            RoundButton {
                text: "–"
                enabled: false
            }
        }

        Label {
            text: "ToolButton"
        }

        RowLayout {
            spacing: 6

            ToolButton {
                text: "✎"
            }

            ToolButton {
                text: "★"
                checkable: true
                checked: true
            }

            ToolButton {
                text: "Text"
            }

            ToolButton {
                text: "✕"
                enabled: false
            }
        }
    }

    Section {
        objectName: "buttons.groups"
        title: "Button groups"

        Label {
            text: "ActionGroup"
        }

        RowLayout {
            spacing: 6

            Button {
                action: listViewAction
            }

            Button {
                action: gridViewAction
            }
        }

        Label {
            text: "ButtonGroup"
        }

        RowLayout {
            spacing: 6

            Button {
                text: "Left"
                checkable: true
                checked: true
                ButtonGroup.group: alignGroup
            }

            Button {
                text: "Center"
                checkable: true
                ButtonGroup.group: alignGroup
            }

            Button {
                text: "Right"
                checkable: true
                ButtonGroup.group: alignGroup
            }
        }
    }

    Section {
        objectName: "buttons.checkboxes"
        title: "Check boxes"

        CheckBox {
            text: "Unchecked"
        }

        CheckBox {
            text: "Checked"
            checked: true
        }

        CheckBox {
            text: "Checked, disabled"
            checked: true
            enabled: false
        }

        CheckBox {
            text: "Disabled"
            enabled: false
        }

        CheckBox {
            id: parentBox
            text: "Parent (tristate)"
            checkState: childGroup.checkState
        }

        CheckBox {
            text: "Child 1"
            checked: true
            ButtonGroup.group: childGroup
        }

        CheckBox {
            text: "Child 2"
            ButtonGroup.group: childGroup
        }
    }

    Section {
        objectName: "buttons.radios"
        title: "Radio buttons"

        RadioButton {
            text: "Option A"
            checked: true
        }

        RadioButton {
            text: "Option B"
        }

        RadioButton {
            text: "Option C"
        }

        RadioButton {
            text: "Disabled"
            enabled: false
        }

        RadioButton {
            text: "Checked, disabled"
            checked: true
            enabled: false
            autoExclusive: false
        }
    }

    Section {
        objectName: "buttons.switches"
        title: "Switches"

        Switch {
            text: "On"
            checked: true
        }

        Switch {
            text: "Off"
        }

        Switch {
            text: "On, disabled"
            checked: true
            enabled: false
        }

        Switch {
            text: "Off, disabled"
            enabled: false
        }
    }
}
