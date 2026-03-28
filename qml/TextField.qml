// Copyright (C) 2025 Blaadick
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.TextField {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftPadding + rightPadding,
        placeholder.implicitWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topPadding + bottomPadding,
        placeholder.implicitHeight + topPadding + bottomPadding
    )

    leftPadding: 10

    color: "#ffffff"
    selectionColor: "#393b40"
    selectedTextColor: "#ffffff"
    placeholderTextColor: control.palette.placeholderText
    verticalAlignment: TextInput.AlignVCenter

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.padding)
        height: control.height - (control.padding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 44
        color: "#26282b"
        radius: 10
    }
}
