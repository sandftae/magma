#!/bin/bash
# shellcheck disable=SC2015
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum input with a validation loop
# ============================================================

# uiRenderGumInput handles the UI lifecycle for a single text input field
uiRenderGumInput() {
    local value="$2"
    local validator="$1"
    local error_msg="$3"
    local title user_input raw_prefix="" config_prefix=""

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    local title_var="${config_prefix}_MENU_TITLE"
    local default_var="${config_prefix}_DEFAULT_VALUE"
    local default_val="${!default_var:-$UI_DEFAULT_VALUE}"
    local current_val="${value:-$default_val}"

    title=$(formatToTitleCase "${!title_var:-$UI_CONFIGURATION_LABEL}")

    while true; do
        {
            [[ -n "$error_msg" ]] \
                       && gum style --foreground 196 --margin "0 3 0 3" "✖ $error_msg" \
                       || gum style --foreground 240 --margin "0 3 0 3" "Tip: format as [name].localhost"

           # re-set headers one more time
           uiStepHeaders
           gum style --foreground "$COLOR_ACCENT" --bold "   $title"

             # if error_msg exists, render error; otherwise, render tip
             [[ -n "$error_msg" ]] \
                 && gum style --foreground 196 --margin "0 3 0 3" "✖ $error_msg" \
                 || gum style --foreground 240 --margin "0 3 0 3" "Tip: format as [name].localhost"

             printf "\n"
        } >&2

        # user input
        user_input=$(gum input --prompt "   > " --value "$current_val" --width 60) || return $?

        [[ -z "$validator" ]] && break
        # validate inout
        error_msg=$("$validator" "$user_input")
        [[ -z "$error_msg" ]] && break

        # store to show user input
        current_val="$user_input"
    done

    # success
    printf '%s' "$user_input"
}