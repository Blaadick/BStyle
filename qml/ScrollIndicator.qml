// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ScrollIndicator {
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

    contentItem: Rectangle {
        implicitWidth: 3
        implicitHeight: 3
        radius: Math.min(width, height) / 2
        color: Theme.handle
        opacity: 0.0

        states: State {
            name: "active"
            when: control.active

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
}
