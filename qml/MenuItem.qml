// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuItem {
    id: control

    readonly property real checkColumn: menu ? menu.checkColumnWidth : 0
    readonly property real iconColumn: menu ? menu.iconColumnWidth : 0
    readonly property real leadingColumns: checkColumn + iconColumn
    readonly property real iconOffset: menu && menu.twoColumns ? checkColumn : 0

    readonly property string shortcutText: shortcutSource.nativeText
    readonly property bool shortcutShown: shortcutText.length > 0
        && (Application.styleHints.showShortcutsInContextMenus || !!menu && menu.isContextMenu === false)
    readonly property real shortcutGap: 16
    readonly property var subMenuIcon: subMenu ? subMenu.icon : null
    readonly property bool ownIcon: icon.name !== "" || icon.source.toString() !== ""
    readonly property string iconName: ownIcon ? icon.name : subMenuIcon ? subMenuIcon.name : ""
    readonly property url iconSource: ownIcon ? icon.source : subMenuIcon ? subMenuIcon.source : ""
    readonly property real iconSize: menu ? menu.iconSize : 20
    readonly property color iconColor: !enabled ? Theme.textDisabled : Theme.text
    readonly property real arrowPadding: subMenu && arrow ? arrow.width + spacing : 0
    readonly property real rowHeight: Math.max(
        implicitContentHeight,
        menu ? menu.rowContentHeight : 0
    )
    readonly property real inset: Theme.inset(implicitBackgroundHeight, rowHeight)

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
            + (shortcutShown ? shortcutGap + shortcutLabel.implicitWidth : 0)
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        rowHeight + topPadding + bottomPadding
    )

    padding: inset
    spacing: menu ? menu.columnSpacing : 8
    hoverEnabled: Application.styleHints.useHoverEffects

    arrow: Chevron {
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        visible: control.subMenu
        rotation: control.mirrored ? 90 : -90
        color: control.enabled ? Theme.textSecondary : Theme.textDisabled
    }

    indicator: CheckIndicator {
        target: control
        x: control.mirrored
            ? control.width - control.rightPadding - width
            : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        visible: control.checkable
    }

    IconImage {
        x: control.mirrored
            ? Math.round(control.width - control.rightPadding - control.iconOffset - width)
            : Math.round(control.leftPadding + control.iconOffset)
        y: Math.round(control.topPadding + (control.availableHeight - height) / 2)
        width: control.iconSize
        height: control.iconSize
        sourceSize: Qt.size(control.iconSize, control.iconSize)
        name: control.iconName
        source: control.iconSource
        color: control.iconColor
        visible: control.iconName !== "" || control.iconSource.toString() !== ""
    }

    Shortcut {
        id: shortcutSource
        enabled: false
        sequences: control.action ? [control.action.shortcut] : []
    }

    Text {
        id: shortcutLabel
        x: control.mirrored
            ? control.leftPadding + control.arrowPadding
            : control.width - control.rightPadding - control.arrowPadding - width
        y: control.topPadding + (control.availableHeight - height) / 2
        text: control.shortcutText
        font: control.font
        color: control.enabled ? Theme.textTertiary : Theme.textDisabled
        visible: control.shortcutShown
    }

    contentItem: IconLabel {
        leftPadding: !control.mirrored ? control.leadingColumns : control.arrowPadding
        rightPadding: control.mirrored ? control.leadingColumns : control.arrowPadding

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft
        icon.name: ""
        icon.source: ""
        text: control.text
        font: control.font
        color: control.iconColor
    }

    background: StateBackground {
        target: control
        hovered: control.highlighted
        implicitWidth: 0
        implicitHeight: Theme.controlHeight
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
