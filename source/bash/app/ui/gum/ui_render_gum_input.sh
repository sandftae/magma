#!/bin/bash
# shellcheck disable=SC2015
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum input with a validation loop
# ============================================================

# uiRenderGumInput handles the UI lifecycle for a single text input field
uiRenderGumInput() {
    local title_raw="$1"
    local value="$2"
    local validator="$3"
    local error_msg="$4"
    local title
    local user_input
    local exit_status
    local current_error

    # format title
    title=$(formatToTitleCase "$title_raw")

    # render UI block directly to stderr to bypass command substitution capture
    {
        __renderHeader "$title"

        # If error_msg exists, render error; otherwise, render tip
        [[ -n "$error_msg" ]] \
            && gum style --foreground 196 --margin "0 3 0 3" "✖ $error_msg" \
            || gum style --foreground 240 --margin "0 3 0 3" "Tip: format as [name].localhost"

        printf "\n"
    } >&2

    # get user data
    user_input=$(gum input --prompt "   > " --value "$value" --width 60)
    exit_status=$?

    # handle ESC / Ctrl+C
    [[ $exit_status -eq 130 ]] && return 255

    # validation
    if [[ -n "$validator" ]]; then
        current_error=$("$validator" "$user_input")
        # validator returns text ? --> recurse with the new error message
        # do not judge me, I just learning bash
        [[ -n "$current_error" ]] && {
            uiRenderGumInput "$title_raw" "$user_input" "$validator" "$current_error"
            return $?
        }
    fi

    # success
    printf '%s' "$user_input"
}

# __renderHeader draws the application hero section and current step title
__renderHeader() {
    local step_title="$1"
    local app_title="${APP_TITLE:-CLI Application}"

    # lear screen and render global exit hint
    clear

    # hero section
    gum style \
        --foreground "$COLOR_PRIMARY" \
        --border double \
        --border-foreground "$COLOR_ACCENT" \
        --align center --width 60 --margin "1 2" --padding "0 1" \
        "$app_title"

    uiRenderExitHint

    # current step title
    gum style --foreground "$COLOR_ACCENT" --bold "   $step_title"
}