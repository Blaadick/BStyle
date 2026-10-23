// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.SplitView {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    hoverEnabled: Application.styleHints.useHoverEffects

    layer.enabled: true
    layer.effect: RoundedClip {}

    handle: Rectangle {
        id: handle

        readonly property bool horizontal: control.orientation === Qt.Horizontal
        readonly property bool pressed: T.SplitHandle.pressed
        readonly property bool hovered: T.SplitHandle.hovered

        implicitWidth: horizontal ? 7 : control.width
        implicitHeight: horizontal ? control.height : 7
        color: Theme.surface

        Separator {
            anchors.fill: parent
            vertical: handle.horizontal
            hovered: handle.hovered
            pressed: handle.pressed
        }
    }
}
