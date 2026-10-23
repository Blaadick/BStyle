// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.SpinBox {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        contentItem.implicitWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding,
        up.implicitIndicatorHeight, down.implicitIndicatorHeight
    )

    leftPadding: 40
    rightPadding: 40
    spacing: 4
    hoverEnabled: Application.styleHints.useHoverEffects

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: TextInput {
        z: 2
        text: control.displayText
        font: control.font
        color: control.enabled ? Theme.text : Theme.textDisabled
        selectionColor: Theme.primarySubtle
        selectedTextColor: Theme.text
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints
        clip: width < implicitWidth

        T.ContextMenu.menu: TextEditingContextMenu {
            editor: parent
        }
    }

    up.indicator: StateBackground {
        x: control.mirrored ? 4 : control.width - width - 4
        y: 4
        implicitWidth: 28
        implicitHeight: Theme.controlHeight - 8
        height: control.height - 8
        baseRadius: Theme.radiusSmall
        hovered: control.up.hovered
        pressed: control.up.pressed
        active: control.enabled

        PlusMinus {
            anchors.centerIn: parent
            plus: true
            color: !control.enabled || (!control.wrap && control.value === control.to) ? Theme.textDisabled : Theme.text
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }

    down.indicator: StateBackground {
        x: control.mirrored ? control.width - width - 4 : 4
        y: 4
        implicitWidth: 28
        implicitHeight: Theme.controlHeight - 8
        height: control.height - 8
        baseRadius: Theme.radiusSmall
        hovered: control.down.hovered
        pressed: control.down.pressed
        active: control.enabled

        PlusMinus {
            anchors.centerIn: parent
            plus: false
            color: !control.enabled || (!control.wrap && control.value === control.from) ? Theme.textDisabled : Theme.text
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }

    background: FieldBackground {
        target: control
        implicitWidth: 130
    }
}
