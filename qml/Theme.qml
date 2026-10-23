// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

pragma Singleton

import QtQuick

QtObject {
    id: root

    readonly property bool isDark: Application.styleHints.colorScheme === 2
    readonly property bool isHighContrast: Application.styleHints.accessibility.contrastPreference === 1
    readonly property bool isMotionReduced: Application.styleHints.accessibility.motionPreference === 1

    readonly property color primary: pick("#8060db", "#d4c6fa", "#b9a3ff", "#4527a8")
    readonly property color primaryHover: pick("#8c6de6", "#cebef9", "#c7b5ff", "#5232b8")
    readonly property color primaryPress: pick("#6c4ebb", "#c0adf5", "#a58cf5", "#361d88")
    readonly property color primaryStroke: pick("#8060db", "#8466de", "#b9a3ff", "#4527a8")
    readonly property color primaryBorder: pick("#9c88e8", "#b3a1e6", "#f1e7ff", "#170050")
    readonly property color primaryBorderHover: pick("#a894f7", "#ac9ade", "#fff9ff", "#210362")
    readonly property color primaryBorderPress: pick("#8873d2", "#9e8ccf", "#dad2f7", "#0a0033")
    readonly property color primaryText: pick("#a894f6", "#7b5ad8", "#c4b1ff", "#4527a8")
    readonly property color textOnPrimary: pick("#ffffff", "#1d1238", "#000000", "#ffffff")
    readonly property color primarySubtle: pick("#4a387b", "#ede7fd", "#4e2fb0", "#c0acf9")

    readonly property color background: pick("#1a1a1a", "#f8f8f8", "#000000", "#f8f8f8")
    readonly property color surface: pick("#232323", "#ffffff", "#121212", "#ffffff")
    readonly property color frame: pick("#282828", "#eaeaea", "#1c1c1c", "#eaeaea")
    readonly property color surfaceRaised: pick("#282828", "#ffffff", "#1c1c1c", "#ffffff")
    readonly property color field: pick("#1a1a1a", "#ffffff", "#000000", "#ffffff")
    readonly property color secondary: pick("#434343", "#dfdfdf", "#5e5e5e", "#8f8f8f")
    readonly property color disabledFill: pick("#1a1a1a", "#f8f8f8", "#000000", "#f8f8f8")

    readonly property color outline: pick("#353535", "#dfdfdf", "#6b6b6b", "#8a8a8a")
    readonly property color border: pick("#353535", "#dbdbdb", "#9e9e9e", "#6b6b6b")
    readonly property color borderHover: pick("#4c4c4c", "#c9c9c9", "#e0e0e0", "#1f1f1f")
    readonly property color borderPress: pick("#5c5c5c", "#bbbbbb", "#e0e0e0", "#1f1f1f")
    readonly property color borderDisabled: pick("#353535", "#d4d4d4", "#4a4a4a", "#b0b0b0")

    readonly property color text: pick("#d3d3d3", "#000000", "#ffffff", "#000000")
    readonly property color textSecondary: pick("#a2a2a2", "#626262", "#d6d6d6", "#3b3b3b")
    readonly property color textTertiary: pick("#6e6e6e", "#969696", "#adadad", "#555555")
    readonly property color textDisabled: pick("#5c5c5c", "#a2a2a2", "#8a8a8a", "#6e6e6e")

    readonly property color scrim: pick("#99000000", "#59000000", "#b3000000", "#80000000")
    readonly property color hoverLayer: pick("#17ffffff", "#12000000", "#29ffffff", "#1f000000")
    readonly property color pressLayer: pick("#29ffffff", "#20000000", "#42ffffff", "#33000000")
    readonly property color clearLayer: Qt.alpha(hoverLayer, 0)
    readonly property color clearFill: Qt.alpha(primary, 0)
    readonly property color handle: pick("#17ffffff", "#12000000", "#66ffffff", "#73000000")
    readonly property color handleHover: pick("#29ffffff", "#20000000", "#8cffffff", "#99000000")
    readonly property color handlePress: pick("#40ffffff", "#32000000", "#b3ffffff", "#b3000000")

    readonly property int controlHeight: 36
    readonly property int delegateHeight: 40
    readonly property int listSpacing: 4
    readonly property int radiusSmall: 5
    readonly property int radius: 8
    readonly property int radiusLarge: 14
    readonly property int fast: isMotionReduced ? 0 : 60
    readonly property int normal: isMotionReduced ? 0 : 120
    readonly property int slow: isMotionReduced ? 0 : 240

    function pick(dark, light, darkContrast, lightContrast) {
        return isHighContrast ? (isDark ? darkContrast : lightContrast) : isDark ? dark : light
    }

    function layer(base, over, hovered, pressed) {
        return pressed ? Qt.tint(base, Qt.alpha(over, 0.16)) : hovered ? Qt.tint(base, Qt.alpha(over, 0.08)) : base
    }

    function inset(outer, inner) {
        return Math.max(0, (outer - inner) / 2)
    }

    function stateLayer(hovered, pressed) {
        return pressed ? pressLayer : hovered ? hoverLayer : clearLayer
    }
}
