#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum choose with multi-select enabled
# ============================================================

# function uiRenderGumMultiSelect
uiRenderGumMultiSelect() {
    local title="$1"
    shift
    local options=("$@")
    local choices
    local exitCode

    # gum returns selected items separated by newline
    choices=$(gum choose --no-limit --header "$title" "${options[@]}")
    exitCode=$?

    # handle ctrl+c / esc
    [[ $exitCode -eq 130 ]] && return 255

    # convert newlines to spaces and return
    echo "$choices" | tr '\n' ' ' | sed 's/ *$//'
    return 0
}