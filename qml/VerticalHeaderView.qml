// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.VerticalHeaderView {
    id: control

    implicitWidth: Math.max(1, contentWidth)
    implicitHeight: syncView ? syncView.height : 0

    clip: true
    delegate: VerticalHeaderViewDelegate {}

    Rectangle {
        parent: control
        z: -1
        anchors.fill: parent
        color: Theme.surface

        Rectangle {
            width: 1
            height: parent.height
            x: parent.width - 1
            color: Theme.outline
        }
    }
}
