// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ItemDelegate {
    id: control

    required property var model
    required property int index
    property string textRole
    property bool current: false

    width: ListView.view ? ListView.view.width : implicitWidth
    text: {
        const m = control.model
        if(m === null || m === undefined) {
            return ""
        }

        if(typeof m !== "object") {
            return String(m)
        }

        const role = control.textRole
        if(role) {
            return m[role] ?? (m.modelData ? m.modelData[role] : "") ?? ""
        }

        return m.modelData ?? m.display ?? ""
    }

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: Theme.inset(implicitBackgroundHeight, implicitContentHeight)
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    icon.width: 20
    icon.height: 20
    icon.color: !enabled ? Theme.textDisabled : current ? Theme.textOnPrimary : Theme.text

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

    background: StateBackground {
        target: control
        hovered: control.highlighted
        emphasized: control.current
        implicitWidth: 0
        implicitHeight: Theme.controlHeight
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
