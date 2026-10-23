// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuBarItem {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)

    padding: inset
    spacing: 6
    down: pressed || (!!menu && menu.visible)
    hoverEnabled: Application.styleHints.useHoverEffects

    icon.width: 18
    icon.height: 18
    icon.color: !enabled ? Theme.textDisabled : Theme.text

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft
        icon: control.icon
        text: control.text
        font: control.font
        color: control.icon.color
    }

    background: ButtonBackground {
        target: control
        flat: true
        implicitWidth: 0
        implicitHeight: 30
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
