#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for text input fields with optional validation
# ============================================================

# function uiInput
uiInput() {
    local validator_func="$2"
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumInput "$validator_func" ;;
        "dialog") uiRenderDialogInput "$validator_func" ;;
    esac
}