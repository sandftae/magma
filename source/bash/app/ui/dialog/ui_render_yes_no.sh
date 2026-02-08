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
    local no_button_label_var="${config_prefix}_NO_LABEL"
    local yes_button_label_var="${config_prefix}_OK_LABEL"
    local extra_button_label_var="${config_prefix}_EXTRA_LABEL"

    local height="${!height_var:-15}"
    local yes_button_label="${!yes_button_label_var:-$UI_OK_LABEL}"
    local no_button_label="${!no_button_label_var:-$UI_BACK_LABEL}"
    local extra_button_label="${!extra_button_label_var:-$UI_EXTRA_LABEL}"
    local title="${!title_var:-SELECT}"

    dialog --clear --colors --backtitle "$UI_BACKTITLE" \
        --title "$title" \
        --extra-button \
        --extra-label "$extra_button_label" \
        --yes-label   "$yes_button_label" \
        --no-label    "$no_button_label" \
        --yesno "$message" "$height" 70

    local exit_code=$?
    case $exit_code in
        0)   return 10 ;; #   ->  *_EXTRA_LABEL
        1)   return 1  ;; #   ->  *_NO_LABEL
        3)   return 0  ;; #   ->  *_YES_LABEL
        255) return 255 ;;
    esac
}