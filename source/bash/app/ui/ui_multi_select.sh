#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: router for multi-selection checklists
# ============================================================

# function uiMultiSelect
uiMultiSelect() {
    local title="$1"
    shift
    local options=("$@")
    local mode
    mode=$(getAppConfig "uiMode")

    case "$mode" in
        "gum")
            uiRenderGumMultiSelect "$title" "${options[@]}"
            ;;
        "dialog")
            uiRenderDialogMultiSelect "$title" "${options[@]}"
            ;;
    esac
}