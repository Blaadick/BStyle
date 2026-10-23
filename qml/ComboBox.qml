// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ComboBox {
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

    readonly property real inset: Theme.inset(implicitBackgroundHeight, contentItem.contentHeight)
    readonly property real indicatorInset: indicator ? Theme.inset(implicitBackgroundHeight, indicator.height) : 0

    leftPadding: !mirrored || !indicator || !indicator.visible ? inset : indicatorInset + indicator.width + spacing
    rightPadding: mirrored || !indicator || !indicator.visible ? inset : indicatorInset + indicator.width + spacing
    topPadding: 8
    bottomPadding: 8
    spacing: 8
    hoverEnabled: Application.styleHints.useHoverEffects

    delegate: MenuDelegate {
        id: delegate
        textRole: control.textRole
        current: control.currentIndex === delegate.index
        highlighted: control.highlightedIndex === delegate.index
        hoverEnabled: control.hoverEnabled
    }

    indicator: Chevron {
        x: control.mirrored ? control.indicatorInset : control.width - width - control.indicatorInset
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.enabled ? Theme.textSecondary : Theme.textDisabled
        rotation: control.popup.visible ? 180 : 0

        Behavior on rotation {
            NumberAnimation {
                duration: Theme.normal
            }
        }
    }

    contentItem: T.TextField {
        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        color: control.enabled ? Theme.text : Theme.textDisabled
        selectionColor: Theme.primarySubtle
        selectedTextColor: Theme.text
        verticalAlignment: Text.AlignVCenter

        T.ContextMenu.menu: TextEditingContextMenu {
            editor: parent
        }
    }

    background: Item {
        implicitWidth: 140
        implicitHeight: Theme.controlHeight

        FieldBackground {
            anchors.fill: parent
            target: control
            visible: control.editable && !control.flat
        }

        ButtonBackground {
            anchors.fill: parent
            target: control
            flat: control.flat
            visible: !control.editable || control.flat
        }
    }

    popup: MenuPopup {
        target: control
        model: control.delegateModel
        currentIndex: control.highlightedIndex
    }
}
