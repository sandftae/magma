#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum input with a validation loop
# ============================================================

# function uiRenderGumInput
uiRenderGumInput() {
    local title="$1"
    local value="$2"
    local validator="$3"
    local userInput
    local errorMessage

    while :; do
        userInput=$(gum input --header "$title" --value "$value")
        # handle ctrl+c / esc
        [[ $? -eq 130 ]] && return 255

        # if no validator provided, return value
        [[ -z "$validator" ]] && { printf '%s' "$userInput"; return 0; }

        # execute validation
        errorMessage=$($validator "$userInput")

        # if valid (empty error message), return result
        [[ -z "$errorMessage" ]] && { printf '%s' "$userInput"; return 0; }

        # show error using gum style and repeat
        gum style --foreground 196 "Validation Error: $errorMessage"
        value="$userInput"
    done
}