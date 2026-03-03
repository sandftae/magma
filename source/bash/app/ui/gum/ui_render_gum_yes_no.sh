#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders yes/no prompt using gum extra-button
# ============================================================

# uiRenderGumYesNo displays a 'yes/no' menu
uiRenderGumYesNo() {
    local choice
    local message="$1"
    local raw_prefix=""
    local config_prefix=""

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    local title_var="${config_prefix}_MENU_TITLE"
    local proceed_button_label_var="${config_prefix}_NO_LABEL"    # <- 'No, Im Good'
    local extra_button_label_var="${config_prefix}_EXTRA_LABEL"   # <- 'Add Services'

    local proceed_button_label="${!proceed_button_label_var:-$UI_EXTRA_LABEL}"    # <- 'No, Im Good'
    local extra_button_label="${!extra_button_label_var:-$UI_EXTRA_LABEL}"        # <- 'Add Services'

    gum style --foreground "$COLOR_ACCENT" --bold "   $(formatToTitleCase "${!title_var:-SUMMARY}")"
    printf "%s" "$message" | gum format --type="template"

    choice=$(
        printf "\n%s\n%s\n" "$extra_button_label" "$proceed_button_label" |
        gum choose \
          --header "" \
          --header.margin "0 1 1 3" \
          --item.margin "0 0 0 3" \
          --item.padding "0 0 0 0" \
          --selected.margin "0 0 0 3" \
          --cursor.padding="0 3 0 0" \
          --cursor="   >" \
          --selected.foreground="$COLOR_ACCENT"
    ) || return $? # <- handle ESC and CTRL + C

    [[ "$choice" == $proceed_button_label"" ]] && return 10 # <- handle 'No, Im Good'

    return 0 # < - handle 'Add Services'
}