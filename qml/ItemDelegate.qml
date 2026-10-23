// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ItemDelegate {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding,
        implicitIndicatorHeight + topPadding + bottomPadding
    )

    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)

    padding: inset
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    icon.width: 18
    icon.height: 18
    icon.color: !enabled ? Theme.textDisabled : highlighted ? Theme.textOnPrimary : Theme.text

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.display === T.AbstractButton.IconOnly
            || control.display === T.AbstractButton.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft
        icon: control.icon
        text: control.text
        font: control.font
        color: control.icon.color
    }

    background: StateBackground {
        target: control
        emphasized: control.highlighted
        implicitHeight: Theme.delegateHeight
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
