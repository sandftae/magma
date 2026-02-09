#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using bash dialog
# ============================================================

# uiRenderDialogMenu renders a selection menu
uiRenderDialogMenu() {
    local choice opt config_prefix

    config_prefix=$(getAppConfig "step" | tr '[:lower:]' '[:upper:]')

    local width_var="${config_prefix}_DIALOG_WIDTH"
    local backtitle_var="${config_prefix}_BACKTITLE"
    local menu_title_var="${config_prefix}_MENU_TITLE"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local tooltip_var="${config_prefix}_DIALOG_TOOLTIP"
    local menu_height="${config_prefix}_DIALOG_MENU_HEIGHT"
    local cancel_label="${config_prefix}_DIALOG_CANCEL_LABEL"

    local width="${!width_var:-$UI_DIALOG_WIDTH}"
    local height="${!height_var:-$UI_DIALOG_HEIGHT}"
    local backtitle="${!backtitle_var:-$UI_BACKTITLE}"
    local cancel_label="${!cancel_label:-$UI_CANCEL_LABEL}"
    local tooltip="${!tooltip_var:-$UI_UP_AND_DOWN_TOOLTIP}"
    local menu_height="${!height_var:-$UI_DIALOG_MENU_HEIGHT}"
    local menu_title="${!menu_title_var:-$UI_CONFIGURATION_LABEL}"

    # format options for dialog
    local dialogOptions=()
    for opt in "$@"; do dialogOptions+=("$opt" ""); done

    # it it is the first step, change label to Exit
    [[ "$(getAppConfig "current_step_index")" == "0" ]] && cancel="$EDITION_CANCEL_LABEL"

    # execute dialog
    choice=$(
        dialog --clear --colors --no-collapse \
            --backtitle "$backtitle" \
            --title "$menu_title" \
            --cancel-label "$cancel" \
            --menu "$tooltip" "$height" "$width" "$menu_height" \
            "${dialogOptions[@]}" 3>&1 1>&2 2>&3
    ) || return $?

    printf '%s' "$choice"
}