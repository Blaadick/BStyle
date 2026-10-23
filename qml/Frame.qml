// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Frame {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding
    )

    padding: 8

    layer.enabled: Math.min(leftPadding, rightPadding, topPadding, bottomPadding) < Theme.radius
    layer.effect: RoundedClip {}

    background: Rectangle {
        color: "transparent"
        radius: Theme.radius
        border.color: Theme.outline
    }
}
