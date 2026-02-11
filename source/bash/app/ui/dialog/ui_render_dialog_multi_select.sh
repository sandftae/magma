#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog checklist for multiple selection
# ============================================================

# uiRenderDialogMultiSelect displays a checklist and returns space-separated IDs
uiRenderDialogMultiSelect() {
    local message="$1"
    shift
    local options=("$@")
    local config_prefix

    config_prefix=$(getAppConfig "step" | tr '[:lower:]' '[:upper:]')
    local title_var="${config_prefix}_MENU_TITLE"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local width_var="${config_prefix}_DIALOG_WIDTH"
    local choices

    choices=$(dialog --clear --colors \
        --backtitle "$UI_BACKTITLE" \
        --title "$(formatToTitleCase "${!title_var:-Services Selection}")" \
        --cancel-label "$UI_BACK_LABEL" \
        --checklist "$message" \
        "${!height_var:-18}" "${!width_var:-75}" 10 \
        "${options[@]}" 2>&1 >/dev/tty) || return $?

    # dialog with --separate-output returns items on new lines
    echo "$choices" | tr '\n' ' ' | sed 's/ *$//'
}