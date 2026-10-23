// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TabButton {
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
    readonly property color contentColor: !enabled ? Theme.textDisabled
        : checked ? Theme.primaryText
            : hovered ? Theme.text : Theme.textSecondary

    leftPadding: squeezed ? Math.max(4, (width - implicitContentWidth) / 2) : inset
    rightPadding: squeezed ? leftPadding : inset
    topPadding: inset
    bottomPadding: inset
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects
    font.weight: Font.Medium

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

    background: Rectangle {
        implicitHeight: 44
        color: control.enabled ? Theme.stateLayer(control.hovered, control.down) : Theme.clearLayer

        Rectangle {
            width: parent.width
            height: 2
            y: control.T.TabBar.position === T.TabBar.Footer ? 0 : parent.height - height
            radius: 1
            color: Theme.primaryStroke
            visible: control.checked
        }

        FocusRing {
            visible: control.visualFocus
            baseRadius: 0
            anchors.margins: -2
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
