#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using gum
# ============================================================

# uiRenderGumMenu provides a professional menu with a non-selectable separator
uiRenderGumMenu() {
    local raw_prefix=""
    local config_prefix=""
    local title
    local choice=""
    local options=("$@")
    local separator="
    "

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    # combine options with a visual separator and back button
    local menu_items=("${options[@]}" "$separator" "< BACK")
    local menu_title_var="${config_prefix}_MENU_TITLE"
    local menu_title="${!menu_title_var:-$UI_CONFIGURATION_LABEL}"
    title=$(formatToTitleCase "$menu_title")

    # loop until a valid selection is made (skips the separator)
    while true; do
        choice=$(
            gum choose \
                --header "$title" \
                --header.margin "0 0 0 3" \
                --item.margin "0 0 0 3" \
                --item.padding "0 0 0 0" \
                --selected.margin "0 0 0 3" \
                --cursor.padding="0 3 0 0" \
                --cursor="   >" \
                --selected.foreground="$COLOR_ACCENT" \
                "${menu_items[@]}"
        )

        local exitCode=$?

        # handle esc / ctrl+c
        [[ $exitCode -eq 130 || -z "$choice" ]] && return 255

        # handle navigation back
        [[ "$choice" == "< BACK" ]] && return 1

        # if user selected the separator, just continue the loop
        [[ "$choice" == "$separator" ]] && continue

        # valid choice made
        break
    done

    # return choice to stdout
    printf '%s' "$choice"
    return 0
}