// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.DialogButtonBox {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        (control.count === 1 ? implicitContentWidth * 2 : implicitContentWidth)
        + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    contentWidth: contentItem.contentWidth

    spacing: 8
    padding: 10
    alignment: Qt.AlignRight

    delegate: Button {}

    contentItem: ListView {
        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
    }

    background: Rectangle {
        implicitHeight: 52
        color: "transparent"
    }
}
