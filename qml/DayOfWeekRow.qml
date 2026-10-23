// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.AbstractDayOfWeekRow {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        7 * Theme.controlHeight + 6 * spacing + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    spacing: 4
    topPadding: 6
    bottomPadding: 6
    font.weight: Font.DemiBold

    delegate: Text {
        required property string shortName

        width: (control.availableWidth - 6 * control.spacing) / 7
        text: shortName
        font: control.font
        color: control.enabled ? Theme.textSecondary : Theme.textDisabled
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.source
            delegate: control.delegate
        }
    }
}
