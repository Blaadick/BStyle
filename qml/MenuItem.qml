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

    icon.width: 16
    icon.height: 16

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable ? control.indicator.width + control.spacing : 0
        leftPadding: control.icon.name.length > 0 || control.icon.source.toString().length > 0 ? 0 : 16 + control.spacing
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding
        spacing: control.spacing

        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        defaultIconColor: "#ffffff"
        text: control.text
        font: control.font
        color: "#ffffff"
    }

    indicator: CheckIndicator {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        width: control.icon.width
        height: control.icon.height
        radius: 5
        color: "#191a1c"

        isChecked: control.checked
        visible: control.checkable
    }

    arrow: IconImage {
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        width: control.icon.width
        height: control.icon.height
        name: "arrow-right"
        color: control.icon.color

        mirror: control.mirrored
        visible: control.subMenu
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.icon.height
        radius: 10
        color: control.highlighted ? "#393b40" : "#26282b"
    }
}
