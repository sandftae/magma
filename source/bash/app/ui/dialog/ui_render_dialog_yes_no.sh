#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders yes/no prompt using dialog extra-button
# ============================================================

  # uiRenderDialogYesNo displays a 'yes/no' menu
uiRenderDialogYesNo() {
    local message="$1"
    local raw_prefix=""
    local config_prefix=""

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    local title_var="${config_prefix}_MENU_TITLE"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local back_title_var="${config_prefix}_BACKTITLE"
    local proceed_button_label_var="${config_prefix}_NO_LABEL"    # <- 'No, Im Good'
    local yes_button_label_var="${config_prefix}_YES_LABEL"       # <- '< Back'
    local extra_button_label_var="${config_prefix}_EXTRA_LABEL"   # <- 'Add Services'

    local height="${!height_var:-15}"
    local back_title="${!back_title_var:-$UI_BACKTITLE}"
    local yes_button_label="${!yes_button_label_var:-$UI_OK_LABEL}"             # <- '< Back'
    local proceed_button_label="${!proceed_button_label_var:-$UI_BACK_LABEL}"   # <- 'No, Im Good'
    local extra_button_label="${!extra_button_label_var:-$UI_EXTRA_LABEL}"      # <- 'Add Services'
    local title="${!title_var:-SELECT}"

    dialog --clear \
        --colors \
        --backtitle "$back_title" \
        --title "$title" \
        --extra-button \
        --no-label    "$yes_button_label" \
        --yes-label   "$proceed_button_label" \
        --extra-label "$extra_button_label" \
        --yesno "$message" "$height" 70

    local exit_code=$?

    case $exit_code in
        0)        return 10 ;;    # <- 'No, Im Good'
        1)        return 1  ;;    # <- '< Back'
        3)        return 0  ;;    # <- 'Add Services'
        255 | *)  return 255 ;;   # <- handle ESC / CTRL + C || unrecognizable error
    esac
}