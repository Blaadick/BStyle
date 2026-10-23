// Copyright (C) 2026 Blaadick
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.Controls.impl as Impl

Menu {
    id: menu
    popupType: Qt.platform.pluginName !== "wayland" ? T.Popup.Window : T.Popup.Item

    required property Item editor

    Impl.UndoAction {
        editor: menu.editor
    }

    Impl.RedoAction {
        editor: menu.editor
    }

    MenuSeparator {}

    Impl.CutAction {
        editor: menu.editor
    }

    Impl.CopyAction {
        editor: menu.editor
    }

    Impl.PasteAction {
        editor: menu.editor
    }

    Impl.DeleteAction {
        editor: menu.editor
    }

    MenuSeparator {}

    Impl.SelectAllAction {
        editor: menu.editor
    }
}
