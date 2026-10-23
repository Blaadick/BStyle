// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.HeaderViewDelegate {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    padding: 8
    highlighted: selected

    contentItem: Label {
        text: control.model[control.headerView.textRole] ?? ""
        font.weight: Font.DemiBold
        color: !control.enabled ? Theme.textDisabled
            : control.highlighted ? Theme.primaryText : Theme.textSecondary
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        color: Theme.surface

        Rectangle {
            width: parent.width
            height: 1
            y: parent.height - 1
            color: Theme.outline
            visible: control.y + control.height < control.headerView.contentHeight - 1
                || control.headerView.contentHeight < control.headerView.height
        }

        Rectangle {
            width: 1
            height: parent.height
            x: parent.width - 1
            color: Theme.outline
        }
    }
}
