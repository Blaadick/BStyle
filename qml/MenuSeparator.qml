// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.MenuSeparator {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: 0

    contentItem: Item {
        implicitHeight: 1

        Rectangle {
            x: Theme.radius
            width: parent.width - 2 * Theme.radius
            height: parent.height
            radius: height / 2
            color: Theme.borderDisabled
        }
    }
}
