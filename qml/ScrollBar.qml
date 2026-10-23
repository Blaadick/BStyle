// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ScrollBar {
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
    visible: control.policy !== T.ScrollBar.AlwaysOff
    minimumSize: orientation === Qt.Horizontal ? height / width : width / height
    hoverEnabled: Application.styleHints.useHoverEffects

    contentItem: Rectangle {
        implicitWidth: control.interactive ? 8 : 3
        implicitHeight: control.interactive ? 8 : 3
        radius: Math.min(width, height) / 2
        color: control.pressed ? Theme.handlePress : control.hovered ? Theme.handleHover : Theme.handle
        opacity: 0.0

        Behavior on color {
            ColorAnimation {
                duration: Theme.normal
            }
        }

        states: State {
            name: "active"
            when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0)

            PropertyChanges {
                control.contentItem.opacity: 1.0
            }
        }

        transitions: Transition {
            from: "active"

            SequentialAnimation {
                PauseAnimation {
                    duration: Theme.slow * 2
                }

                NumberAnimation {
                    target: control.contentItem
                    duration: Theme.slow
                    property: "opacity"
                    to: 0.0
                }
            }
        }
    }

    HoverHandler {
        enabled: control.interactive && control.contentItem.opacity > 0
        cursorShape: control.orientation === Qt.Horizontal ? Qt.SizeHorCursor : Qt.SizeVerCursor
    }
}
