// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ToolSeparator {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: vertical ? 8 : 4
    verticalPadding: vertical ? 4 : 8

    contentItem: Rectangle {
        implicitWidth: control.vertical ? 1 : 24
        implicitHeight: control.vertical ? 24 : 1
        color: Theme.outline
    }
}
