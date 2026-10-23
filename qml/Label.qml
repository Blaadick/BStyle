// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Templates as T

T.Label {
    color: enabled ? Theme.text : Theme.textDisabled
    linkColor: Theme.primaryText
}
