#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for text input fields with optional validation
# ============================================================

# function uiInput
uiInput() {
    local validator_func="$2"
    local step_prefix="$1"
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumInput "$step_prefix" "$validator_func" ;;
        "dialog") uiRenderDialogInput "$step_prefix" "$validator_func" ;;
    esac
}