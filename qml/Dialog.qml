// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Dialog {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding,
        implicitHeaderWidth,
        implicitFooterWidth
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        contentHeight
        + topPadding
        + bottomPadding
        + (implicitHeaderHeight > 0 ? implicitHeaderHeight + spacing : 0)
        + (implicitFooterHeight > 0 ? implicitFooterHeight + spacing : 0)
    )

    padding: 10
    spacing: 10

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: Theme.normal
        }

        NumberAnimation {
            property: "scale"
            from: 0.96
            to: 1.0
            duration: Theme.normal
            easing.type: Easing.OutCubic
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: Theme.fast
        }

        NumberAnimation {
            property: "scale"
            from: 1.0
            to: 0.96
            duration: Theme.fast
        }
    }

    background: Rectangle {
        radius: Theme.radiusLarge
        color: Theme.surfaceRaised
        border.color: Theme.outline
    }

    header: Label {
        text: control.title
        visible: control.title
        elide: Text.ElideRight
        font.pixelSize: 18
        font.weight: Font.DemiBold
        leftPadding: control.padding
        rightPadding: control.padding
        topPadding: control.padding
        bottomPadding: 0
    }

    footer: DialogButtonBox {
        visible: count > 0
        padding: control.padding
        topPadding: 0
    }

    T.Overlay.modal: Rectangle {
        color: Theme.scrim

        Behavior on opacity {
            NumberAnimation {
                duration: Theme.slow
            }
        }
    }

    T.Overlay.modeless: Rectangle {
        color: Qt.alpha(Theme.scrim, 0.3)

        Behavior on opacity {
            NumberAnimation {
                duration: Theme.slow
            }
        }
    }
}
