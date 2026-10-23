// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Slider {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitHandleWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitHandleHeight + topPadding + bottomPadding
    )

    readonly property bool hasSteps: stepSize > 0 && snapMode !== T.Slider.NoSnap && to > from
    readonly property int stepCount: hasSteps ? Math.floor((to - from) / stepSize + 1e-6) + 1 : 0
    readonly property real handleExtent: handle ? (horizontal ? handle.width : handle.height) : 0
    readonly property real trackExtent: horizontal ? availableWidth : availableHeight
    readonly property bool ticksVisible: stepCount > 1 && (trackExtent - handleExtent) / (stepCount - 1) >= 6

    padding: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    handle: SliderHandle {
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width)
            : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2
            : control.visualPosition * (control.availableHeight - height))
        pressed: control.pressed
        hovered: control.hovered
        focused: control.visualFocus
        enabled: control.enabled
    }

    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : 4
        implicitHeight: control.horizontal ? 4 : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight
        radius: 2
        color: Theme.secondary
        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            y: control.horizontal ? 0 : parent.height - height
            width: control.horizontal ? control.position * parent.width : 4
            height: control.horizontal ? 4 : control.position * parent.height
            radius: 2
            color: control.enabled ? Theme.primaryStroke : Theme.textDisabled
        }

        Repeater {
            model: control.ticksVisible ? control.stepCount : 0

            Rectangle {
                required property int index

                readonly property real ratio: (index * control.stepSize) / (control.to - control.from)
                readonly property real offset: control.handleExtent / 2 + ratio * (control.trackExtent - control.handleExtent)

                x: control.horizontal ? offset - width / 2 : (parent.width - width) / 2
                y: control.horizontal ? (parent.height - height) / 2 : parent.height - offset - height / 2
                width: control.horizontal ? 2 : 8
                height: control.horizontal ? 8 : 2
                radius: 1
                color: !control.enabled ? Theme.secondary : ratio <= control.position + 1e-6 ? Theme.primaryStroke : Theme.secondary
                opacity: control.enabled ? 1 : 0.6
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        cursorShape: !control.enabled ? Qt.ArrowCursor
            : control.pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor
    }
}
