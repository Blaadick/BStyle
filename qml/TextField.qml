// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
        || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding,
        placeholder.implicitHeight + topPadding + bottomPadding
    )

    padding: Theme.inset(implicitBackgroundHeight, contentHeight)
    hoverEnabled: Application.styleHints.useHoverEffects

    color: enabled ? Theme.text : Theme.textDisabled
    selectionColor: Theme.primarySubtle
    selectedTextColor: Theme.text
    placeholderTextColor: Theme.textTertiary
    verticalAlignment: TextInput.AlignVCenter

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    T.ContextMenu.menu: TextEditingContextMenu {
        editor: control
    }

    background: FieldBackground {
        target: control
    }
}
