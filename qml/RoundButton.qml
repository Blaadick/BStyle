// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.RoundButton {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + 2 * 8
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    readonly property bool squeezed: width > 0 && width < implicitWidth

    leftPadding: squeezed ? Math.max(4, (width - implicitContentWidth) / 2) : 8
    rightPadding: squeezed ? leftPadding : 8
    topPadding: 8
    bottomPadding: 8
    spacing: 8
    radius: Math.min(width, height) / 2
    hoverEnabled: Application.styleHints.useHoverEffects

    readonly property bool emphasized: checked || highlighted
    readonly property color contentColor: !enabled ? Theme.textDisabled
        : emphasized ? Theme.textOnPrimary
            : Theme.text

    icon.width: 20
    icon.height: 20
    icon.color: contentColor

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        color: control.contentColor
    }

    background: ButtonBackground {
        target: control
        emphasized: control.emphasized
        flat: control.flat
        baseRadius: control.radius
        implicitWidth: Theme.controlHeight
        implicitHeight: Theme.controlHeight
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
