// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Shapes

Item {
    id: root
    implicitWidth: 12
    implicitHeight: 12

    property color color: Theme.textSecondary
    property real thickness: 1.75

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeColor: root.color
            strokeWidth: root.thickness
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            startX: root.width * 0.15
            startY: root.height * 0.32

            PathLine {
                x: root.width * 0.50
                y: root.height * 0.68
            }

            PathLine {
                x: root.width * 0.85
                y: root.height * 0.32
            }
        }
    }
}
