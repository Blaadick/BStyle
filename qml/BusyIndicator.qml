// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Shapes
import QtQuick.Templates as T

T.BusyIndicator {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: 4

    contentItem: Item {
        implicitWidth: 40
        implicitHeight: 40
        opacity: control.running ? 1 : 0

        Behavior on opacity {
            OpacityAnimator {
                duration: Theme.slow
            }
        }

        Item {
            id: spinner
            anchors.fill: parent

            RotationAnimator on rotation {
                running: control.running && control.visible && !Theme.isMotionReduced
                loops: Animation.Infinite
                from: 0
                to: 360
                duration: Theme.slow * 4
            }

            Shape {
                anchors.fill: parent
                preferredRendererType: Shape.CurveRenderer

                ShapePath {
                    strokeColor: Theme.secondary
                    strokeWidth: 4
                    fillColor: "transparent"

                    PathAngleArc {
                        centerX: spinner.width / 2
                        centerY: spinner.height / 2
                        radiusX: (Math.min(spinner.width, spinner.height) - 4) / 2
                        radiusY: radiusX
                        startAngle: 0
                        sweepAngle: 360
                    }
                }

                ShapePath {
                    strokeColor: Theme.primaryStroke
                    strokeWidth: 4
                    fillColor: "transparent"
                    capStyle: ShapePath.RoundCap

                    PathAngleArc {
                        centerX: spinner.width / 2
                        centerY: spinner.height / 2
                        radiusX: (Math.min(spinner.width, spinner.height) - 4) / 2
                        radiusY: radiusX
                        startAngle: 0
                        sweepAngle: 100
                    }
                }
            }
        }
    }
}
