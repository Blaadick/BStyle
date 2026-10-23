// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.SwitchDelegate {
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

    leftPadding: inset
    rightPadding: inset
    topPadding: 8
    bottomPadding: 8
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    icon.width: 18
    icon.height: 18
    icon.color: !enabled ? Theme.textDisabled : highlighted ? Theme.textOnPrimary : Theme.text

    contentItem: IconLabel {
        leftPadding: !control.mirrored ? 0 : control.indicator.width + control.spacing
        rightPadding: control.mirrored ? 0 : control.indicator.width + control.spacing
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

    indicator: SwitchIndicator {
        target: control
        x: control.mirrored ? Theme.inset(control.height, height) : control.width - width - Theme.inset(control.height, height)
        y: control.topPadding + (control.availableHeight - height) / 2
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
