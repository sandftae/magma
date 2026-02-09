#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using gum
# ============================================================

# uiRenderGumMenu provides a professional menu with a non-selectable separator
uiRenderGumMenu() {
    local choice
    local menu_title
    local raw_prefix
    local config_prefix
    local menu_title_var

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    menu_title_var="${config_prefix}_MENU_TITLE"
    menu_title="${!menu_title_var:-$UI_CONFIGURATION_LABEL}"

    choice=$(
        gum choose \
            --header "$(formatToTitleCase "$menu_title")" \
            --header.margin "0 0 0 3" \
            --item.margin "0 0 0 3" \
            --item.padding "0 0 0 0" \
            --selected.margin "0 0 0 3" \
            --cursor.padding="0 3 0 0" \
            --cursor="   >" \
            --selected.foreground="$COLOR_ACCENT" \
            "$@"
    ) || return $?

    # output the result
    printf '%s' "$choice"
}