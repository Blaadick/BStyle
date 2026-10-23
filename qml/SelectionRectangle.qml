// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.SelectionRectangle {
    id: control

    topLeftHandle: Handle {}
    bottomRightHandle: Handle {}

    component Handle: Rectangle {
        implicitWidth: 14
        implicitHeight: 14
        radius: width / 2
        color: T.SelectionRectangle.dragging ? Theme.primaryPress : Theme.primary
        border.width: 2
        border.color: Theme.field
        visible: T.SelectionRectangle.control.active

        HoverHandler {
            cursorShape: Qt.SizeFDiagCursor
        }
    }
}
