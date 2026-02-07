#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for overview steps
# ============================================================

# uiOverview routes to the appropriate renderer based on uiMode
uiOverview() {
    local step_prefix="$1"
    local boilerplate="$2"
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumOverview "$step_prefix" "$boilerplate" ; return $? ;;
        "dialog") uiRenderDialogOverview "$step_prefix" "$boilerplate" ; return $? ;;
    esac
}