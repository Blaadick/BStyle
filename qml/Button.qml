// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Button {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + 2 * inset
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    readonly property bool squeezed: width > 0 && width < implicitWidth
    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)

    leftPadding: squeezed ? Math.max(4, (width - implicitContentWidth) / 2) : inset
    rightPadding: squeezed ? leftPadding : inset
    topPadding: inset
    bottomPadding: inset
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects
    font.weight: Font.Medium

    readonly property bool emphasized: checked || highlighted
    readonly property color contentColor: !enabled ? Theme.textDisabled
        : emphasized ? Theme.textOnPrimary
            : Theme.text

    icon.width: 18
    icon.height: 18
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
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
