// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TextArea {
    id: control

    implicitWidth: Math.max(
        contentWidth + leftPadding + rightPadding,
        implicitBackgroundWidth + leftInset + rightInset,
        placeholder.implicitWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        contentHeight + topPadding + bottomPadding,
        implicitBackgroundHeight + topInset + bottomInset,
        placeholder.implicitHeight + topPadding + bottomPadding
    )

    padding: Theme.inset(Theme.controlHeight, Math.ceil(fontMetrics.height))
    hoverEnabled: Application.styleHints.useHoverEffects
    color: enabled ? Theme.text : Theme.textDisabled
    selectionColor: Theme.primarySubtle
    selectedTextColor: Theme.text
    placeholderTextColor: Theme.textTertiary

    FontMetrics {
        id: fontMetrics
        font: control.font
    }

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
        wrapMode: control.wrapMode
        renderType: control.renderType
    }

    T.ContextMenu.menu: TextEditingContextMenu {
        editor: control
    }

    background: FieldBackground {
        target: control
        implicitHeight: 80
    }
}
