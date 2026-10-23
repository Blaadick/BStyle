// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ToolBar {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding
    )

    padding: 4
    spacing: 4

    background: Rectangle {
        implicitHeight: 44
        color: Theme.frame

        Rectangle {
            width: parent.width
            height: 1
            y: control.position === T.ToolBar.Header ? parent.height - 1 : 0
            color: Theme.outline
        }
    }
}
