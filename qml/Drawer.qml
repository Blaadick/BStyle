// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Drawer {
    id: control

    parent: T.Overlay.overlay

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding
    )

    padding: 8

    enter: Transition {
        NumberAnimation {
            duration: Theme.slow
            easing.type: Easing.OutCubic
        }
    }

    exit: Transition {
        NumberAnimation {
            duration: Theme.slow
            easing.type: Easing.OutCubic
        }
    }

    background: Rectangle {
        color: Theme.surface

        Rectangle {
            readonly property bool horizontal: control.edge === Qt.LeftEdge || control.edge === Qt.RightEdge
            width: horizontal ? 1 : parent.width
            height: horizontal ? parent.height : 1
            x: control.edge === Qt.LeftEdge ? parent.width - 1 : 0
            y: control.edge === Qt.TopEdge ? parent.height - 1 : 0
            color: Theme.outline
        }
    }

    T.Overlay.modal: Rectangle {
        color: Theme.scrim
        Behavior on opacity {
            NumberAnimation {
                duration: Theme.slow
            }
        }
    }

    T.Overlay.modeless: Rectangle {
        color: "transparent"
        Behavior on opacity {
            NumberAnimation {
                duration: Theme.slow
            }
        }
    }
}
