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

    # handle esc / ctrl+c (return 255 if exit code is 130 or choice is empty)
    [[ $exitCode -eq 130 || -z "$choice" ]] && return 255

    # handle navigation back
    [[ "$choice" == "< BACK" ]] && return 1

    # return choice to stdout
    printf '%s' "$choice"
    return 0
}