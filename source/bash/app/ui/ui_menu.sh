#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: generic menu selector that routes to the active UI mode
# ============================================================

# function uiMenu
uiMenu() {
    local config_prefix="$1"
    shift
    local options=("$@")
    local mode
    mode=$(getAppConfig "uiMode")

    # routing based on application configuration
    case "$mode" in
        "gum") uiRenderGumMenu "$config_prefix" "${options[@]}" ; return $? ;;
        "dialog") uiRenderDialogMenu  "$config_prefix" "${options[@]}" ; return $? ;;
    esac
}