// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Templates as T

T.Menu {
    id: control

    // x: control.parent ? control.parent.width + 10 : 0

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftPadding + rightPadding,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topPadding + bottomPadding,
        implicitContentHeight + topPadding + bottomPadding
    )
    padding: 5

    icon.color: "#ffffff"
    icon.width: 20
    icon.height: 20

    delegate: MenuItem {}

    contentItem: ListView {
        implicitHeight: contentHeight
        model: control.contentModel
        currentIndex: control.currentIndex
        boundsBehavior: Flickable.StopAtBounds
        spacing: 5
        clip: true
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20
        color: "#202020"
        radius: 10
    }
}
