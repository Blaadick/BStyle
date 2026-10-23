// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.RangeSlider {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        Math.max(first.implicitHandleWidth, second.implicitHandleWidth) + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        Math.max(first.implicitHandleHeight, second.implicitHandleHeight) + topPadding + bottomPadding
    )

    readonly property bool hasSteps: stepSize > 0 && snapMode !== T.RangeSlider.NoSnap && to > from
    readonly property int stepCount: hasSteps ? Math.floor((to - from) / stepSize + 1e-6) + 1 : 0
    readonly property real handleExtent: first.handle ? (horizontal ? first.handle.width : first.handle.height) : 0
    readonly property real trackExtent: horizontal ? availableWidth : availableHeight
    readonly property bool ticksVisible: stepCount > 1 && (trackExtent - handleExtent) / (stepCount - 1) >= 6

    padding: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    first.handle: SliderHandle {
        x: control.leftPadding + (control.horizontal ? control.first.visualPosition * (control.availableWidth - width)
            : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2
            : control.first.visualPosition * (control.availableHeight - height))
        pressed: control.first.pressed
        hovered: control.first.hovered
        focused: control.first.handle.activeFocus && control.visualFocus
        enabled: control.enabled
    }

    second.handle: SliderHandle {
        x: control.leftPadding + (control.horizontal ? control.second.visualPosition * (control.availableWidth - width)
            : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2
            : control.second.visualPosition * (control.availableHeight - height))
        pressed: control.second.pressed
        hovered: control.second.hovered
        focused: control.second.handle.activeFocus && control.visualFocus
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
            x: control.horizontal ? control.first.position * parent.width : 0
            y: control.horizontal ? 0 : control.second.visualPosition * parent.height
            width: control.horizontal ? control.second.position * parent.width - control.first.position * parent.width : 4
            height: control.horizontal ? 4 : control.second.position * parent.height - control.first.position * parent.height
            radius: 2
            color: control.enabled ? Theme.primaryStroke : Theme.textDisabled
        }

        Repeater {
            model: control.ticksVisible ? control.stepCount : 0

            Rectangle {
                required property int index

                readonly property real ratio: (index * control.stepSize) / (control.to - control.from)
                readonly property real offset: control.handleExtent / 2 + ratio * (control.trackExtent - control.handleExtent)
                readonly property bool inRange: ratio >= control.first.position - 1e-6
                    && ratio <= control.second.position + 1e-6

                x: control.horizontal ? offset - width / 2 : (parent.width - width) / 2
                y: control.horizontal ? (parent.height - height) / 2 : parent.height - offset - height / 2
                width: control.horizontal ? 2 : 8
                height: control.horizontal ? 8 : 2
                radius: 1
                color: !control.enabled ? Theme.secondary : inRange ? Theme.primaryStroke : Theme.secondary
                opacity: control.enabled ? 1 : 0.6
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        cursorShape: !control.enabled ? Qt.ArrowCursor
            : control.first.pressed || control.second.pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor
    }
}
