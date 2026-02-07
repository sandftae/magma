#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders stack overview using dialog
# ============================================================

# uiRenderDialogOverview displays a msg box with navigation buttons
uiRenderDialogOverview() {
    local raw_prefix="$1"
    local message="$2"
    local config_prefix="${raw_prefix^^}"

    local back_label_var="${config_prefix}_BACK_LABEL"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local back_title_var="${config_prefix}_BACKTITLE"
    local width_var="${config_prefix}_DIALOG_WIDTH"
    local ok_label_var="${config_prefix}_OK_LABEL"
    local title_var="${config_prefix}_MENU_TITLE"

    local title="${!title_var}"
    local width="${!width_var:-80}"
    local height="${!height_var:-20}"
    local ok_label="${!ok_label_var:-$UI_OK_LABEL}"
    local back_title="${!back_title_var:-$UI_BACKTITLE}"
    local back_label="${!back_label_var:-$UI_BACK_LABEL}"

    dialog --clear \
        --colors \
        --no-collapse \
        --extra-button \
        --backtitle "$back_title" \
        --title "$title" \
        --extra-label "$back_label" \
        --ok-label "$ok_label" \
        --msgbox "$message" "$height" "$width"

    local action_code=$?

    case $action_code in
        0)   return 0   ;; # OK
        3)   return 1   ;; # Back
        255) return 255 ;; # ESC / CTRL + C
    esac
}