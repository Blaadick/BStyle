// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Shapes
import QtQuick.Templates as T

T.Dial {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    hoverEnabled: Application.styleHints.useHoverEffects

    background: Item {
        id: face
        x: control.width / 2 - width / 2
        y: control.height / 2 - height / 2
        width: Math.max(64, Math.min(control.width, control.height))
        height: width
        implicitWidth: 80
        implicitHeight: 80

        readonly property real stroke: 5
        readonly property real arcRadius: (width - stroke) / 2

        Shape {
            anchors.fill: parent
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeColor: Theme.secondary
                strokeWidth: face.stroke
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: face.width / 2
                    centerY: face.height / 2
                    radiusX: face.arcRadius
                    radiusY: face.arcRadius
                    startAngle: control.startAngle - 90
                    sweepAngle: control.endAngle - control.startAngle
                }
            }

            ShapePath {
                strokeColor: control.enabled ? Theme.primaryStroke : Theme.textDisabled
                strokeWidth: face.stroke
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: face.width / 2
                    centerY: face.height / 2
                    radiusX: face.arcRadius
                    radiusY: face.arcRadius
                    startAngle: control.startAngle - 90
                    sweepAngle: Math.max(0, control.angle - control.startAngle)
                }
            }
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width - 22
            height: width
            radius: width / 2
            color: !control.enabled ? Theme.secondary
                : control.pressed ? Theme.layer(Theme.secondary, Theme.text, false, true)
                    : Theme.layer(Theme.secondary, Theme.text, control.hovered, false)
        }

        FocusRing {
            visible: control.visualFocus
            baseRadius: parent.width / 2
        }
    }

    handle: Rectangle {
        id: knob
        x: control.background.x + control.background.width / 2 - width / 2
        y: control.background.y + control.background.height / 2 - height / 2
        width: 8
        height: 8
        radius: 4
        color: control.enabled ? Theme.primaryStroke : Theme.textDisabled
        antialiasing: true

        transform: [
            Translate {
                y: -Math.min(control.background.width, control.background.height) * 0.5 + 22
            },
            Rotation {
                angle: control.angle
                origin.x: knob.width / 2
                origin.y: knob.height / 2
            }
        ]
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        cursorShape: !control.enabled ? Qt.ArrowCursor
            : control.pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor
    }
}
