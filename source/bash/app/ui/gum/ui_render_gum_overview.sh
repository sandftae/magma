#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders stack overview using gum format (Markdown)
# ============================================================

# uiRenderGumOverview displays a formatted summary using Markdown
uiRenderGumOverview() {
    local raw_prefix="$1"
    local message="$2"
    local title_var
    local title
    local config_prefix="${raw_prefix^^}"

    title_var="${config_prefix}_MENU_TITLE"
    title=$(formatToTitleCase "${!title_var:-SUMMARY}")

    __renderHeader "$title"

    # render template in a 'gum' way
    printf "\n%s" "$message" | gum format --type="template"

    # navigation

    gum confirm --default=true --affirmative "Proceed" --negative "Back"
    local exitCode=$?

    # handle ESC ? CTRL + C
    [[ $exitCode -eq 130 ]] && return 255

    # handle 'Proceed'
    [[ $exitCode -eq 0 ]] && return $exitCode

    return 1
}