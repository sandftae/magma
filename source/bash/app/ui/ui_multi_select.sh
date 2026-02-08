#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for multi-selection checklists
# ============================================================

uiMultiSelect() {
    local message="$1"
    shift
    local options=("$@")
    local mode

    # extract session mode
    mode=$(getAppConfig "uiMode")

    # route the args by mode
    case "$mode" in
        "gum")    uiRenderGumMultiSelect "$message" "${options[@]}" ;;
        "dialog") uiRenderDialogMultiSelect "$message" "${options[@]}" ;;
    esac
}