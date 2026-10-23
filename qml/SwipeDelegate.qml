// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.SwipeDelegate {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding,
        implicitIndicatorHeight + topPadding + bottomPadding
    )

    readonly property real inset: Theme.inset(implicitBackgroundHeight, implicitContentHeight)

    padding: inset
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects
    clip: swipe.position !== 0

    icon.width: 18
    icon.height: 18
    icon.color: !enabled ? Theme.textDisabled : highlighted ? Theme.textOnPrimary : Theme.text

    swipe.transition: Transition {
        NumberAnimation {
            duration: Theme.slow
            easing.type: Easing.InOutCubic
        }
    }

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.display === T.AbstractButton.IconOnly
            || control.display === T.AbstractButton.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft
        icon: control.icon
        text: control.text
        font: control.font
        color: control.icon.color
    }

    background: Rectangle {
        implicitHeight: Theme.delegateHeight
        radius: Theme.radius
        color: control.swipe.position !== 0 ? Theme.surface : Theme.clearFill

        HoverHandler {
            id: backgroundHover
        }

        StateBackground {
            anchors.fill: parent
            target: control
            hovered: control.hovered && backgroundHover.hovered
            emphasized: control.highlighted
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    Connections {
        target: control.swipe

        function onPositionChanged() {
            if(control.swipe.position !== 0) {
                return
            }
            for(const item of [control.swipe.leftItem, control.swipe.rightItem, control.swipe.behindItem]) {
                if(item) {
                    item.visible = false
                }
            }
        }
    }
}
