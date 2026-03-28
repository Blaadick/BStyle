// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.ToolButton {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftPadding + rightPadding,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topPadding + bottomPadding,
        implicitContentHeight + topPadding + bottomPadding
    )

    icon.width: 24
    icon.height: 24
    icon.color: "#ffffff"

    contentItem: IconLabel {
        icon: control.icon
        text: control.text
        color: "#ffffff"
    }

    background: Rectangle {
        implicitWidth: 44
        implicitHeight: 44
        color: control.down ? "#393b40" : "#26282b"
        radius: 10
    }
}
