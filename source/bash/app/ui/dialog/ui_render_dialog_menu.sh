#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using bash dialog
# ============================================================

# uiRenderDialogMenu
uiRenderDialogMenu() {
    local raw_prefix="$1"
    shift
    local choice
    local options=("$@")
    local menu_height="${UI_MENU_HEIGHT:-5}"
    local cancel_label="${UI_CANCEL_LABEL:-"Exit"}"

    local config_prefix="${raw_prefix^^}"

    local backtitle_var="${config_prefix}_BACKTITLE"
    local width_var="${config_prefix}_DIALOG_WIDTH"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local tooltip_var="${config_prefix}_DIALOG_TOOLTIP"
    local menu_height="${config_prefix}_DIALOG_MENU_HEIGHT"
    local cancel_label="${config_prefix}_DIALOG_CANCEL_LABEL"
    local menu_title_var="${config_prefix}_MENU_TITLE"

    local backtitle="${!backtitle_var:-$UI_BACKTITLE}"
    local width="${!width_var:-$UI_DIALOG_WIDTH}"
    local height="${!height_var:-$UI_DIALOG_HEIGHT}"
    local tooltip="${!tooltip_var:-$UI_UP_AND_DOWN_TOOLTIP}"
    local menu_height="${!height_var:-$UI_DIALOG_MENU_HEIGHT}"
    local cancel_label="${!cancel_label:-$UI_CANCEL_LABEL}"
    local menu_title="${!menu_title_var:-$UI_CONFIGURATION_LABEL}"

    # format options for dialog
    local dialogOptions=()
    for opt in "${options[@]}"; do
        dialogOptions+=("$opt" "")
    done

    # it it is the first step, change label to Exit
    [[ "$(getAppConfig "current_step_index")" == "0" ]] && cancel_label="$EDITION_CANCEL_LABEL"

    # execute dialog and capture output to a temporary descriptor
    choice=$(dialog --clear \
              --colors \
              --no-collapse \
              --backtitle "$backtitle" \
              --title "$menu_title" \
              --cancel-label "$cancel_label" \
              --menu "$tooltip" "$height" "$width" "$menu_height" \
              "${dialogOptions[@]}" 3>&1 1>&2 2>&3)

    local exitCode=$?

    # handle results
    case "$exitCode" in
        0) printf '%s' "$choice"; return 0 ;;
        1) return 1 ;; # back button
        255) return 255 ;; # esc
    esac
}