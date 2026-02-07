#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: generic menu selector that routes to the active UI mode
# ============================================================

# function uiMenu
uiMenu() {
    local options=("$@")
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum") uiRenderGumMenu "${options[@]}" ; return $? ;;
        "dialog") uiRenderDialogMenu "${options[@]}" ; return $? ;;
    esac
}