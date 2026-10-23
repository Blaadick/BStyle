// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.impl
import QtQuick.Shapes
import QtQuick.Templates as T

T.SearchField {
    id: control

    implicitWidth: Math.max(
        implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding
    )
    implicitHeight: Math.max(
        implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding,
        searchIndicator.implicitIndicatorHeight + 2 * indicatorInset,
        clearIndicator.implicitIndicatorHeight + 2 * indicatorInset
    )

    readonly property bool clearIconVisible: clearIndicator.indicator && clearIndicator.indicator.visible
    readonly property real indicatorInset: Theme.inset(
        implicitBackgroundHeight,
        searchIndicator.indicator.implicitHeight
    )
    property bool suggestionChosen: false

    function searchTyped(event) {
        if(!popup.visible || suggestionChosen) {
            event.accepted = false
            return
        }

        popup.close()
        accepted()
        searchTriggered()
    }

    onHighlighted: suggestionChosen = true
    onTextEdited: suggestionChosen = false

    leftPadding: indicatorInset + searchIndicator.indicator.width + spacing
    rightPadding: indicatorInset + (clearIconVisible ? clearIndicator.indicator.width + spacing : 0)
    topPadding: 8
    bottomPadding: 8
    spacing: 4
    hoverEnabled: Application.styleHints.useHoverEffects

    delegate: MenuDelegate {
        id: delegate
        textRole: control.textRole
        current: control.currentIndex === delegate.index
        highlighted: control.suggestionChosen && control.highlightedIndex === delegate.index
        hoverEnabled: control.hoverEnabled
    }

    searchIndicator.indicator: StateBackground {
        implicitWidth: 28
        implicitHeight: 28
        x: !control.mirrored ? control.indicatorInset : control.width - width - control.indicatorInset
        y: (control.height - height) / 2
        baseRadius: Theme.radiusSmall
        hovered: control.searchIndicator.hovered
        pressed: control.searchIndicator.pressed
        active: control.enabled

        Shape {
            anchors.centerIn: parent
            width: 14
            height: 14
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeColor: control.enabled ? Theme.text : Theme.textDisabled
                strokeWidth: 1.5
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: 6
                    centerY: 6
                    radiusX: 4.75
                    radiusY: 4.75
                    startAngle: 40
                    sweepAngle: 360
                }

                PathMove {
                    x: 9.4
                    y: 9.4
                }

                PathLine {
                    x: 13
                    y: 13
                }
            }
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }

    clearIndicator.indicator: StateBackground {
        implicitWidth: 28
        implicitHeight: 28
        x: control.mirrored ? control.indicatorInset : control.width - width - control.indicatorInset
        y: (control.height - height) / 2
        visible: control.text.length > 0
        baseRadius: Theme.radiusSmall
        hovered: control.clearIndicator.hovered
        pressed: control.clearIndicator.pressed
        active: control.enabled

        Shape {
            anchors.centerIn: parent
            width: 14
            height: 14
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeColor: control.enabled ? Theme.text : Theme.textDisabled
                strokeWidth: 1.5
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathMove {
                    x: 4
                    y: 4
                }

                PathLine {
                    x: 10
                    y: 10
                }

                PathMove {
                    x: 10
                    y: 4
                }

                PathLine {
                    x: 4
                    y: 10
                }
            }
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }

    contentItem: T.TextField
    {
        text: control.text
        placeholderText: control.placeholderText

        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0

        color: control.enabled ? Theme.text : Theme.textDisabled
        placeholderTextColor: Theme.textTertiary
        selectionColor: Theme.primarySubtle
        selectedTextColor: Theme.text
        verticalAlignment: TextInput.AlignVCenter
        selectByMouse: control.selectTextByMouse

        Keys.onReturnPressed: event => control.searchTyped(event)
        Keys.onEnterPressed: event => control.searchTyped(event)
        Keys.onDownPressed: event => {
            event.accepted = control.popup.visible && !control.suggestionChosen && control.highlightedIndex === 0
            if(event.accepted) {
                control.suggestionChosen = true
            }
        }

        T.ContextMenu.menu: TextEditingContextMenu {
            editor: parent
        }

        PlaceholderText {
            id: placeholder
            x: parent.leftPadding
            y: parent.topPadding
            width: parent.width - parent.leftPadding - parent.rightPadding
            height: parent.height - parent.topPadding - parent.bottomPadding

            text: control.placeholderText
            font: parent.font
            color: parent.placeholderTextColor
            visible: !parent.length && !parent.preeditText && (!parent.activeFocus || parent.horizontalAlignment !== Qt.AlignHCenter)
            verticalAlignment: parent.verticalAlignment
            elide: Text.ElideRight
            renderType: parent.renderType
        }
    }

    background: FieldBackground {
        target: control
    }

    popup: MenuPopup {
        target: control
        model: control.delegateModel
        currentIndex: control.highlightedIndex
        onClosed: control.suggestionChosen = false
    }
}
