#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for text input fields with optional validation
# ============================================================

# function uiInput
uiInput() {
    local title="$1"
    local defaultValue="$2"
    local validatorFunc="$3"
    local mode
    mode=$(getAppConfig "uiMode")

    case "$mode" in
        "gum")    uiRenderGumInput "$title" "$defaultValue" "$validatorFunc" ;;
        "dialog") uiRenderDialogInput "$title" "$defaultValue" "$validatorFunc" ;;
    esac
}