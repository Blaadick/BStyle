// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Popup {
    id: control

    required property Item target
    property var model
    property int currentIndex: -1

    y: target.height + Theme.listSpacing
    width: target.width
    height: Math.min(
        contentItem.implicitHeight + topPadding + bottomPadding,
        target.Window.height - topMargin - bottomMargin
    )
    topMargin: 8
    bottomMargin: 8
    padding: Theme.listSpacing

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

    contentItem: ListView {
        clip: true
        implicitHeight: contentHeight
        model: control.model
        currentIndex: control.currentIndex
        highlightMoveDuration: 0
        spacing: Theme.listSpacing

        T.ScrollIndicator.vertical: ScrollIndicator {}
    }

    background: MenuBackground {}
}
