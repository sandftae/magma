#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders stack overview using gum format (Markdown)
# ============================================================

# uiRenderGumOverview displays a formatted summary using Markdown
uiRenderGumOverview() {
    local title title_var
    local message="$1"
    local raw_prefix=""

    raw_prefix=$(getAppConfig "step")

    local config_prefix="${raw_prefix^^}"
    local title_var="${config_prefix}_MENU_TITLE"
    local ok_label_var="${config_prefix}_OK_LABEL"
    local ok_label="${!ok_label_var:-$UI_OK_LABEL}"

    title=$(formatToTitleCase "${!title_var:-SUMMARY}")
    gum style --foreground "$COLOR_ACCENT" --bold "   $title"

    # render template in a 'gum' way
    printf "\n%s" "$message" | gum format --type="template"

    # navigation
    gum choose \
        --header "" \
        --header.margin "0 0 0 3" \
        --item.margin "0 0 0 3" \
        --item.padding "0 0 0 0" \
        --selected.margin "0 0 0 3" \
        --cursor.padding="0 3 0 0" \
        --cursor="   >" \
        --selected.foreground="$COLOR_ACCENT" \
        "$ok_label" || return $?

    return 0
}