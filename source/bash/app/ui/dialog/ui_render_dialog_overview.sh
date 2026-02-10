#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders stack overview using dialog
# ============================================================

#  displays a msg box with navigation buttons
uiRenderDialogOverview() {
    local config_prefix raw_prefix message="$1"

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    local back_title_var="${config_prefix}_BACKTITLE"
    local title_var="${config_prefix}_MENU_TITLE"
    local back_label_var="${config_prefix}_BACK_LABEL"
    local ok_label_var="${config_prefix}_OK_LABEL"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local width_var="${config_prefix}_DIALOG_WIDTH"

    dialog --clear \
        --colors \
        --no-collapse \
        --extra-button \
        --backtitle "${!back_title_var:-$UI_BACKTITLE}" \
        --title "${!title_var}" \
        --extra-label "${!back_label_var:-$UI_BACK_LABEL}" \
        --ok-label "${!ok_label_var:-$UI_OK_LABEL}" \
        --msgbox "$message" \
        "${!height_var:-20}" \
        "${!width_var:-80}"

    local status=$?

    # handle exit codes
    [[ $status -eq 3 ]]   && return 1   # Back button
    [[ $status -eq 255 ]] && return 255 # ESC / Ctrl+C

    return 0
}