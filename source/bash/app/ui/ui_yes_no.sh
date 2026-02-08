#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for action steps
# ============================================================

# uiYesNo routes to the appropriate renderer
uiYesNo() {
    local boilerplate="$1"
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumYesNo "$boilerplate" ; return $? ;;
        "dialog") uiRenderDialogYesNo "$boilerplate" ; return $? ;;
    esac
}