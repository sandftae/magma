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
    local yes_button_label_var="${config_prefix}_YES_LABEL"       # <- '< Back'
    local extra_button_label_var="${config_prefix}_EXTRA_LABEL"   # <- 'Add Services'

    local yes_button_label="${!yes_button_label_var:-$UI_OK_LABEL}"             # <- '< Back'
    local proceed_button_label="${!proceed_button_label_var:-$UI_BACK_LABEL}"   # <- 'No, Im Good'
    local extra_button_label="${!extra_button_label_var:-$UI_EXTRA_LABEL}"      # <- 'Add Services'

    title=$(formatToTitleCase "${!title_var:-SUMMARY}")
    __renderHeader "$title"

    printf "%s" "$message" | gum format --type="template"

    choice=$(
        printf "\n%s\n%s\n%s" "$extra_button_label" "$proceed_button_label" "< $yes_button_label" |
        gum choose \
          --header "" \
          --header.margin "0 1 1 3" \
          --item.margin "0 0 0 3" \
          --item.padding "0 0 0 0" \
          --selected.margin "0 0 0 3" \
          --cursor.padding="0 3 0 0" \
          --cursor="   >" \
          --selected.foreground="$COLOR_ACCENT"
    )

    [[ -z "$choice" ]] && return 255                            # <- handle ESC / CTRL + C
    [[ "$choice" == "$extra_button_label" ]] && return 0        # <- handle 'Add Services'
    [[ "$choice" == $proceed_button_label"" ]] && return 10     # <- handle 'No, Im Good'

    return 1                                                    # <- otherwise, handle '< Back'
}