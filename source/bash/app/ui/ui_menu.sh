#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: generic menu selector that routes to the active UI mode
# ============================================================

# function uiMenu
uiMenu() {
    local title="$1"
    shift
    local options=("$@")
    local mode
    mode=$(getAppConfig "uiMode")

    # routing based on application configuration
    case "$mode" in
        "gum") uiRenderGumMenu "$title" "${options[@]}" ; return $? ;;
        "dialog") uiRenderDialogMenu "$title" "${options[@]}" ; return $? ;;
    esac
}