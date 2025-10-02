// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Templates as T

T.ToolTip {
    id: control

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: parent ? parent.height + 5 : 0
    implicitWidth: Math.max(
        implicitBackgroundWidth + leftPadding + rightPadding,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topPadding + bottomPadding,
        implicitContentHeight + topPadding + bottomPadding
    )
    padding: 10

    contentItem: Text {
        text: control.text
        wrapMode: Text.Wrap
        font: control.font
        color: "#ffffff"
    }

    background: Rectangle {
        color: "#2d2d2d"
        radius: 10
    }
}
