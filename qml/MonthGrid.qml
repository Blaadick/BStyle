// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.AbstractMonthGrid {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        7 * Theme.controlHeight + 6 * spacing + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        6 * Theme.controlHeight + 5 * spacing + topPadding + bottomPadding
    )

    spacing: 4

    delegate: Item {
        id: cell

        required property var model

        readonly property bool inMonth: model.month === control.month
        readonly property bool today: model.today && inMonth

        width: (control.availableWidth - 6 * control.spacing) / 7
        height: (control.availableHeight - 5 * control.spacing) / 6

        StateBackground {
            anchors.fill: parent
            hovered: Application.styleHints.useHoverEffects && hover.hovered
            pressed: press.active
            active: control.enabled
            emphasized: cell.today
        }

        Text {
            anchors.fill: parent
            text: cell.model.day
            font: control.font
            color: !control.enabled || !cell.inMonth ? Theme.textDisabled
                : cell.today ? Theme.textOnPrimary : Theme.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        HoverHandler {
            id: hover
            cursorShape: Qt.PointingHandCursor
        }

        PointHandler {
            id: press
            acceptedButtons: Qt.LeftButton
        }
    }

    contentItem: Grid {
        rows: 6
        columns: 7
        rowSpacing: control.spacing
        columnSpacing: control.spacing

        Repeater {
            model: control.source
            delegate: control.delegate
        }
    }
}
