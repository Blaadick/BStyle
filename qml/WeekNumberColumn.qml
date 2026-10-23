// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.AbstractWeekNumberColumn {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        Theme.controlHeight + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        6 * Theme.controlHeight + 5 * spacing + topPadding + bottomPadding
    )

    spacing: 4

    delegate: Text {
        required property int weekNumber

        width: control.availableWidth
        height: (control.availableHeight - 5 * control.spacing) / 6
        text: weekNumber
        font: control.font
        color: control.enabled ? Theme.textSecondary : Theme.textDisabled
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    contentItem: Column {
        spacing: control.spacing

        Repeater {
            model: control.source
            delegate: control.delegate
        }
    }
}
