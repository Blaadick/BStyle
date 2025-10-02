// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.MenuItem {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftPadding + rightPadding,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topPadding + bottomPadding,
        implicitContentHeight + topPadding + bottomPadding
    )
    padding: 5
    spacing: 5

    icon.color: "#ffffff"
    icon.width: 20
    icon.height: 20

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable ? control.indicator.width + control.spacing : 0
        leftPadding: control.icon.name ? 0 : 20 + control.spacing
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding
        spacing: control.spacing

        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: "#ffffff"
    }

    indicator: CheckIndicator {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 20
        height: 20
        radius: 5
        color: "#202020"
        isChecked: control.checked
        visible: control.checkable
    }

    arrow: IconImage {
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        visible: control.subMenu
        mirror: control.mirrored
        name: "draw-arrow-forward"
        color: "#ffffff"
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 10
        color: control.highlighted ? "#3a3a3a" : "#2d2d2d"
        radius: 10
    }
}
