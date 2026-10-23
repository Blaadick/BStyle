// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

Rectangle {
    id: root

    property var target
    readonly property bool focused: !!target && (target.activeFocus || target.visualFocus
        || (!!target.contentItem && target.contentItem.activeFocus === true))
    readonly property bool visualFocus: !!target && (keyboardFocused(target) || keyboardFocused(target.contentItem))

    function keyboardFocused(item) {
        return !!item && item.activeFocus === true && (item.focusReason === Qt.TabFocusReason
            || item.focusReason === Qt.BacktabFocusReason || item.focusReason === Qt.ShortcutFocusReason)
    }

    implicitWidth: 200
    implicitHeight: Theme.controlHeight
    radius: Theme.radius
    color: target && target.enabled ? Theme.field : Theme.disabledFill
    border.color: !target || !target.enabled ? Theme.borderDisabled
        : focused || target.down === true ? Theme.borderPress
            : target.hovered ? Theme.borderHover : Theme.border

    Behavior on border.color {
        ColorAnimation {
            duration: Theme.normal
        }
    }
    Behavior on color {
        ColorAnimation {
            duration: Theme.normal
        }
    }

    FocusRing {
        visible: root.visualFocus
        baseRadius: root.radius
    }
}
