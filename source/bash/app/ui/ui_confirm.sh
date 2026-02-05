#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for yes/no confirmation dialogs
# ============================================================

# function uiConfirm
uiConfirm() {
    local message="$1"
    local mode
    mode=$(getAppConfig "uiMode")

    case "$mode" in
        "gum") uiRenderGumConfirm "$message" ;;
        "dialog") uiRenderDialogConfirm "$message" ;;
    esac
}