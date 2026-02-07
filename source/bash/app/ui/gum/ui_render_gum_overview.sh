#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders stack overview using gum format (Markdown)
# ============================================================

# uiRenderGumOverview displays a formatted summary using Markdown
uiRenderGumOverview() {
    local title
    local choice
    local title_var
    local message="$1"
    local raw_prefix=""

    raw_prefix=$(getAppConfig "step")

    local config_prefix="${raw_prefix^^}"
    local title_var="${config_prefix}_MENU_TITLE"
    local ok_label_var="${config_prefix}_OK_LABEL"
    local back_label_var="${config_prefix}_OK_LABEL"
    local back_label_var="${config_prefix}_BACK_LABEL"

    local ok_label="${!ok_label_var:-$UI_OK_LABEL}"
    local back_label="${!back_label_var:-$UI_BACK_LABEL}"

    title=$(formatToTitleCase "${!title_var:-SUMMARY}")

    __renderHeader "$title"

    # render template in a 'gum' way
    printf "\n%s" "$message" | gum format --type="template"

    # navigation
    choice=$(gum choose \
        --header "" \
        --header.margin "0 0 0 3" \
        --item.margin "0 0 0 3" \
        --item.padding "0 0 0 0" \
        --selected.margin "0 0 0 3" \
        --cursor.padding="0 3 0 0" \
        --cursor="   >" \
        --selected.foreground="$COLOR_ACCENT" \
        "$ok_label" "$back_label")

    local exitCode=$?

    # handle CTRL + C
    [[ $exitCode -eq 130 ]] && return 255

    # handle ESC
    [[ -z "$choice" ]] && return 255

    # handle 'Proceed'
    [[ "$choice" == "Proceed" ]] && return 0

    return 1
}