// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ProgressBar {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 6
        scale: control.mirrored ? -1 : 1

        Rectangle {
            visible: !control.indeterminate
            width: control.position * parent.width
            height: parent.height
            radius: height / 2
            color: control.enabled ? Theme.primaryStroke : Theme.textDisabled
        }

        Item {
            anchors.fill: parent
            visible: control.indeterminate

            Rectangle {
                visible: Theme.isMotionReduced
                anchors.fill: parent
                radius: height / 2
                color: control.enabled ? Theme.primaryStroke : Theme.textDisabled
                opacity: 0.4
            }

            Rectangle {
                id: bar

                property real progress: 0
                readonly property real length: parent.width * 0.35
                readonly property real head: progress * (parent.width + length)
                readonly property real tail: Math.max(0, head - length)
                readonly property real visibleLength: Math.max(0, Math.min(parent.width, head) - tail)

                visible: !Theme.isMotionReduced && visibleLength > 0
                x: Math.min(tail, parent.width - height)
                width: Math.max(height, visibleLength)
                height: parent.height
                radius: height / 2
                opacity: Math.min(1, visibleLength / height)
                color: control.enabled ? Theme.primaryStroke : Theme.textDisabled

                NumberAnimation on progress {
                    running: control.indeterminate && control.visible && !Theme.isMotionReduced
                    loops: Animation.Infinite
                    from: 0
                    to: 1
                    duration: Theme.slow * 5
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        y: (control.height - height) / 2
        height: 6
        radius: 3
        color: Theme.secondary
    }
}
