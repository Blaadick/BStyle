// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ExamplePage {
    title: "Values"
    subtitle: "Sliders, dials, tumblers and progress."

    Section {
        objectName: "values.sliders"
        title: "Sliders"

        Slider {
            value: 0.4
            Layout.fillWidth: true
        }

        Slider {
            from: 0
            to: 10
            value: 5
            stepSize: 1
            snapMode: Slider.SnapAlways
            Layout.fillWidth: true
        }

        RangeSlider {
            first.value: 0.2
            second.value: 0.7
            Layout.fillWidth: true
        }

        Slider {
            value: 0.4
            enabled: false
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: 10
            Layout.preferredHeight: 140

            Slider {
                orientation: Qt.Vertical
                value: 0.6
                Layout.fillHeight: true
            }

            RangeSlider {
                orientation: Qt.Vertical
                first.value: 0.3
                second.value: 0.8
                Layout.fillHeight: true
            }

            Slider {
                orientation: Qt.Vertical
                value: 0.6
                enabled: false
                Layout.fillHeight: true
            }
        }
    }

    Section {
        objectName: "values.dials"
        title: "Dials and tumblers"

        RowLayout {
            spacing: 10

            Dial {
                id: dial
                value: 0.5
            }

            Dial {
                value: 0.7
                enabled: false
            }

            Label {
                text: dial.value.toFixed(2)
            }
        }

        RowLayout {
            spacing: 10

            Tumbler {
                model: 24
            }

            Tumbler {
                model: ["Mon", "Tue", "Wed", "Thu", "Fri"]
                wrap: false
            }

            Tumbler {
                model: 12
                visibleItemCount: 3
                enabled: false
            }
        }
    }

    Section {
        objectName: "values.progress"
        title: "Progress and activity"
        Layout.columnSpan: Math.min(2, parent.columns)

        Label {
            text: "Determinate"
        }

        ProgressBar {
            value: 0.6
            Layout.fillWidth: true
        }

        Label {
            text: "Indeterminate"
        }

        ProgressBar {
            indeterminate: true
            Layout.fillWidth: true
        }

        Label {
            text: "Disabled"
        }

        ProgressBar {
            value: 0.3
            enabled: false
            Layout.fillWidth: true
        }

        Label {
            text: "BusyIndicator"
        }

        RowLayout {
            spacing: 10

            BusyIndicator {
                running: true
            }

            BusyIndicator {
                running: false
            }
        }
    }
}
