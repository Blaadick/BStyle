// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.PageIndicator {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: 6
    spacing: 6
    hoverEnabled: Application.styleHints.useHoverEffects

    delegate: Rectangle {
        required property int index

        implicitWidth: 8
        implicitHeight: 8
        radius: width / 2
        color: index === control.currentIndex ? Theme.primaryStroke
            : control.interactive && (pressed || control.hoverEnabled && hoverHandler.hovered) ? Theme.borderHover : Theme.border
        scale: index === control.currentIndex ? 1.25 : 1.0

        Behavior on color {
            ColorAnimation {
                duration: Theme.slow
            }
        }

        Behavior on scale {
            NumberAnimation {
                duration: Theme.slow
            }
        }

        HoverHandler {
            id: hoverHandler
            enabled: control.interactive
            cursorShape: Qt.PointingHandCursor
        }
    }

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
