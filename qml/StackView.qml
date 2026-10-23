// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.StackView {
    id: control
    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
    implicitHeight: implicitBackgroundHeight + topInset + bottomInset

    layer.enabled: true
    layer.effect: RoundedClip {}

    popEnter: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: Theme.slow
            }

            XAnimator {
                from: (control.mirrored ? 1 : -1) * control.width * 0.12
                to: 0
                duration: Theme.slow
                easing.type: Easing.OutCubic
            }
        }
    }

    popExit: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: Theme.slow
            }

            XAnimator {
                from: 0
                to: (control.mirrored ? -1 : 1) * control.width * 0.12
                duration: Theme.slow
                easing.type: Easing.OutCubic
            }
        }
    }

    pushEnter: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: Theme.slow
            }

            XAnimator {
                from: (control.mirrored ? -1 : 1) * control.width * 0.12
                to: 0
                duration: Theme.slow
                easing.type: Easing.OutCubic
            }
        }
    }

    pushExit: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: Theme.slow
            }

            XAnimator {
                from: 0
                to: (control.mirrored ? 1 : -1) * control.width * 0.12
                duration: Theme.slow
                easing.type: Easing.OutCubic
            }
        }
    }

    replaceEnter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: Theme.slow
        }
    }

    replaceExit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: Theme.slow
        }
    }
}
