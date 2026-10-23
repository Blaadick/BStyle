// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Menu {
    id: control

    readonly property real maxItemImplicitWidth: {
        var w = 0
        for(let i = 0; i < count; ++i) {
            const it = itemAt(i)
            if(it && it.visible) {
                w = Math.max(w, it.implicitWidth)
            }
        }

        return w
    }

    implicitWidth: Math.ceil(Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        maxItemImplicitWidth + leftPadding + rightPadding
    ))
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding
    )

    margins: 0
    padding: Theme.listSpacing
    overlap: -Theme.listSpacing

    readonly property real iconSize: 20
    readonly property real checkSize: 20
    readonly property real columnSpacing: 8
    readonly property bool hasChecks: scan(false)
    readonly property bool hasIcons: scan(true)
    readonly property bool twoColumns: scanBoth()
    readonly property real rowContentHeight: Math.max(hasIcons ? iconSize : 0, hasChecks ? checkSize : 0)
    readonly property real checkColumnWidth: {
        if(!hasChecks && !hasIcons) {
            return 0
        }

        if(!twoColumns) {
            return Math.max(hasChecks ? checkSize : 0, hasIcons ? iconSize : 0) + columnSpacing
        }

        return checkSize + columnSpacing
    }

    readonly property real iconColumnWidth: twoColumns ? iconSize + columnSpacing : 0
    readonly property bool isContextMenu: parent instanceof T.MenuBarItem ? false
        : parent instanceof T.MenuItem && parent.menu ? parent.menu.isContextMenu !== false
            : true

    function isSelectable(index) {
        const it = itemAt(index)
        return !!it && it.enabled && it.activeFocusOnTab
    }

    function wrapSelection(step) {
        for(let i = currentIndex + step; i >= 0 && i < count; i += step) {
            if(isSelectable(i)) {
                return false
            }
        }

        for(let i = step > 0 ? 0 : count - 1; i >= 0 && i < count; i += step) {
            if(isSelectable(i)) {
                if(i !== currentIndex) {
                    itemAt(i).forceActiveFocus(step > 0 ? Qt.TabFocusReason : Qt.BacktabFocusReason)
                    currentIndex = i
                }

                return true
            }
        }

        return false
    }

    function itemHasIcon(it) {
        const ic = it.icon
        if(ic && (String(ic.name) !== "" || String(ic.source) !== "")) {
            return true
        }

        const sic = it.subMenu ? it.subMenu.icon : null
        if(sic && (String(sic.name) !== "" || String(sic.source) !== "")) {
            return true
        }

        const a = it.action
        return !!a && (String(a.icon.name) !== "" || String(a.icon.source) !== "")
    }

    function scan(icons) {
        for(let i = 0; i < count; ++i) {
            const it = itemAt(i)
            if(!it || !it.visible) {
                continue
            }

            const a = it.action
            if(icons) {
                if(itemHasIcon(it)) {
                    return true
                }
            } else if(it.checkable || (a && a.checkable)) {
                return true
            }
        }

        return false
    }

    function scanBoth() {
        for(let i = 0; i < count; ++i) {
            const it = itemAt(i)

            if(!it || !it.visible) {
                continue
            }

            const a = it.action
            if(itemHasIcon(it) && (it.checkable || (a && a.checkable))) {
                return true
            }
        }

        return false
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: Theme.normal
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: Theme.fast
        }
    }

    delegate: MenuItem {}

    contentItem: ListView {
        implicitHeight: contentHeight
        model: control.contentModel
        interactive: Window.window ? contentHeight + control.topPadding + control.bottomPadding > Window.window.height : false
        clip: true
        spacing: Theme.listSpacing
        currentIndex: control.currentIndex

        Keys.onPressed: event => {
            event.accepted = Application.styleHints.menuSelectionWraps
                && (event.key === Qt.Key_Down && control.wrapSelection(1)
                    || event.key === Qt.Key_Up && control.wrapSelection(-1))
        }

        T.ScrollIndicator.vertical: ScrollIndicator {}
    }

    background: MenuBackground {}

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
