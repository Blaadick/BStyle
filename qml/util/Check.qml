// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Shapes

Item {
    id: root
    implicitWidth: 14
    implicitHeight: 14

    property color color: Theme.textOnPrimary
    property real thickness: 2

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeColor: root.color
            strokeWidth: root.thickness
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            startX: root.width * 0.18
            startY: root.height * 0.54

            PathLine {
                x: root.width * 0.42
                y: root.height * 0.76
            }

            PathLine {
                x: root.width * 0.82
                y: root.height * 0.26
            }
        }
    }
}
