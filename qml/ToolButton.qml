// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ToolButton {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + 2 * inset
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    leftPadding: squeezed ? Math.max(4, (width - implicitContentWidth) / 2) : inset
    rightPadding: squeezed ? leftPadding : inset
    topPadding: inset
    bottomPadding: inset
    spacing: 6
    hoverEnabled: Application.styleHints.useHoverEffects

    readonly property bool squeezed: width > 0 && width < implicitWidth
    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)
    readonly property color contentColor: !enabled ? Theme.textDisabled
        : checked || highlighted ? Theme.textOnPrimary : Theme.text

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

    background: StateBackground {
        target: control
        emphasized: control.checked || control.highlighted
        implicitWidth: Theme.controlHeight
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
