// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.ApplicationWindow {
    id: window
    color: Theme.background

    palette {
        window: Theme.background
        windowText: Theme.text
        base: Theme.field
        alternateBase: Theme.surface
        text: Theme.text
        button: Theme.field
        buttonText: Theme.text
        brightText: Theme.textOnPrimary
        highlight: Theme.primary
        highlightedText: Theme.textOnPrimary
        placeholderText: Theme.textTertiary
        link: Theme.primaryText
        linkVisited: Theme.primaryText
        toolTipBase: Theme.surfaceRaised
        toolTipText: Theme.text
        accent: Theme.primary
        light: Theme.surface
        midlight: Theme.hoverLayer
        mid: Theme.outline
        dark: Theme.border
    }
}
