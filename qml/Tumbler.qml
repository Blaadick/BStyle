// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Tumbler {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding
    )

    delegate: Text {
        id: item

        required property var model
        required property int index

        text: {
            const m = item.model
            const role = control.textRole
            if(!role) {
                return m.modelData ?? m.display ?? ""
            }
            return m[role] ?? (m.modelData ? m.modelData[role] : "") ?? ""
        }

        font: control.font
        color: !control.enabled ? Theme.textDisabled
            : item.index === control.currentIndex ? Theme.textOnPrimary : Theme.text
        opacity: 1.0 - Math.abs(T.Tumbler.displacement) / (control.visibleItemCount / 2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    contentItem: TumblerView {
        id: view
        implicitWidth: 60
        implicitHeight: 200

        readonly property real delegateHeight: control.availableHeight / control.visibleItemCount

        model: control.model
        delegate: control.delegate
        clip: true

        PointHandler {
            id: pressTracker
            enabled: control.enabled
            acceptedButtons: Qt.LeftButton
        }

        path: Path {
            startX: view.width / 2
            startY: -view.delegateHeight / 2

            PathLine {
                x: view.width / 2
                y: (control.visibleItemCount + 1) * view.delegateHeight - view.delegateHeight / 2
            }
        }
    }

    background: Item {
        Rectangle {
            width: parent.width
            height: control.availableHeight / control.visibleItemCount
            y: (parent.height - height) / 2
            radius: Theme.radius
            color: control.enabled ? Theme.primary : Theme.secondary
        }
    }

    MouseArea {
        id: dragArea

        readonly property PathView pathView: {
            const item = control.contentItem
            if(item instanceof PathView) {
                return item
            }

            return item ? Array.from(item.children).find(child => child instanceof PathView) ?? null : null
        }
        readonly property real itemHeight: control.availableHeight / control.visibleItemCount
        property real startY
        property real startOffset
        property real lastY
        property real lastTime
        property real velocity
        property bool dragging

        anchors.fill: parent
        z: 1
        acceptedButtons: pathView ? Qt.LeftButton : Qt.NoButton
        preventStealing: true
        cursorShape: !control.enabled ? Qt.ArrowCursor
            : pressTracker.active || pressed ? Qt.ClosedHandCursor
                : Qt.OpenHandCursor

        onPressed: mouse => {
            settle.stop()
            dragging = false
            startY = mouse.y
            startOffset = pathView.offset
            lastY = mouse.y
            lastTime = Date.now()
            velocity = 0
        }

        onPositionChanged: mouse => {
            if(!dragging) {
                if(Math.abs(mouse.y - startY) <= Application.styleHints.startDragDistance) {
                    return
                }

                dragging = true
                startY = mouse.y
                lastY = mouse.y
                lastTime = Date.now()
            }

            const now = Date.now()
            if(now > lastTime) {
                velocity = velocity / 2 + (mouse.y - lastY) / (now - lastTime) * 500
            }

            lastY = mouse.y
            lastTime = now
            pathView.offset = startOffset + (mouse.y - startY) / itemHeight
        }

        function fling() {
            const maximum = pathView.maximumFlickVelocity / itemHeight
            const speed = Date.now() - lastTime > 100 ? 0
                : Math.max(-maximum, Math.min(maximum, velocity / itemHeight))
            const deceleration = pathView.flickDeceleration / 10
            const distance = Math.min(pathView.count - 1, speed * speed / (2 * deceleration))
            const target = Math.round(pathView.offset + Math.sign(speed) * distance)
            settle.from = pathView.offset
            settle.to = target
            settle.duration = Theme.isMotionReduced ? 0
                : Math.abs(speed) * itemHeight > 75 ? 2000 * Math.abs(target - pathView.offset) / Math.abs(speed)
                : Theme.normal
            settle.start()
        }

        onReleased: fling()
        onCanceled: fling()

        NumberAnimation {
            id: settle
            target: dragArea.pathView
            property: "offset"
            easing.type: Easing.OutQuad
        }
    }
}
