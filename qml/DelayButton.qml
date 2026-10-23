// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.DelayButton {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + 2 * inset
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    readonly property bool squeezed: width > 0 && width < implicitWidth
    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)
    readonly property color contentColor: !enabled ? Theme.textDisabled
        : checked || progress > 0.5 ? Theme.textOnPrimary : Theme.text

    leftPadding: squeezed ? Math.max(4, (width - implicitContentWidth) / 2) : inset
    rightPadding: squeezed ? leftPadding : inset
    topPadding: inset
    bottomPadding: inset
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects
    font.weight: Font.Medium

    transition: Transition {
        NumberAnimation {
            duration: control.pressed ? control.delay * (1.0 - control.progress)
                : control.delay * 0.3 * control.progress
        }
    }

    icon.width: 18
    icon.height: 18
    icon.color: contentColor

    contentItem: Item {
        id: contentRoot
        implicitWidth: baseLabel.implicitWidth
        implicitHeight: baseLabel.implicitHeight

        IconLabel {
            id: baseLabel
            anchors.fill: parent
            spacing: control.spacing
            mirrored: control.mirrored
            display: control.display
            icon.name: control.icon.name
            icon.source: control.icon.source
            icon.width: control.icon.width
            icon.height: control.icon.height
            icon.color: control.enabled ? Theme.text : Theme.textDisabled
            text: control.text
            font: control.font
            color: control.enabled ? Theme.text : Theme.textDisabled
        }

        Item {
            x: 0
            y: 0
            width: Math.max(0, bg.borderWidth + control.progress * (bg.width - 2 * bg.borderWidth) - contentRoot.x)
            height: parent.height
            clip: true
            visible: control.enabled && control.progress > 0

            IconLabel {
                width: contentRoot.width
                height: contentRoot.height
                spacing: control.spacing
                mirrored: control.mirrored
                display: control.display
                icon.name: control.icon.name
                icon.source: control.icon.source
                icon.width: control.icon.width
                icon.height: control.icon.height
                icon.color: Theme.textOnPrimary
                text: control.text
                font: control.font
                color: Theme.textOnPrimary
            }
        }
    }

    background: ButtonBackground {
        id: bg
        target: control
        emphasized: control.checked
        emphasizedBorder: control.progress > 0
        implicitWidth: 120

        Item {
            x: 0
            y: 0
            width: Math.max(0, bg.borderWidth + control.progress * (bg.width - 2 * bg.borderWidth))
            height: parent.height
            clip: true
            visible: control.enabled && control.progress > 0

            Rectangle {
                x: bg.borderWidth
                y: bg.borderWidth
                width: bg.width - 2 * bg.borderWidth
                height: bg.height - 2 * bg.borderWidth
                radius: bg.radius - bg.borderWidth
                color: control.progress < 1 ? Theme.primaryPress : Theme.primary

                Behavior on color {
                    ColorAnimation {
                        duration: Theme.normal
                    }
                }
            }
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
