#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for text input fields with optional validation
# ============================================================

# function uiInput
uiInput() {
    local validator_func="$1"
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumInput "$validator_func" ; return $? ;;
        "dialog") uiRenderDialogInput "$validator_func" ; return $? ;;
    esac
}