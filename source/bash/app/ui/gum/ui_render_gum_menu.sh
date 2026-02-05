#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using gum
# ============================================================

# function uiRenderGumMenu
uiRenderGumMenu() {
    local title="$1"
    shift
    local options=("$@")
    local choice

    # render gum choose
    choice=$(gum choose --header "$title" "${options[@]}" "< BACK")
    local exitCode=$?

    # handle esc / ctrl+c
    [[ $exitCode -eq 130 ]] && return 255

    # handle navigation back
    [[ "$choice" == "< BACK" ]] && return 1

    # return choice to stdout
    printf '%s' "$choice"
    return 0
}