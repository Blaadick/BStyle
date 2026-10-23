// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.HorizontalHeaderView {
    id: control

    implicitWidth: syncView ? syncView.width : 0
    implicitHeight: Math.max(1, contentHeight)

    clip: true
    delegate: HorizontalHeaderViewDelegate {}

    Rectangle {
        parent: control
        z: -1
        anchors.fill: parent
        color: Theme.surface

        Rectangle {
            width: parent.width
            height: 1
            y: parent.height - 1
            color: Theme.outline
        }
    }
}
