#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using bash dialog
# ============================================================

# uiRenderDialogMenu
uiRenderDialogMenu() {
    local title="$1"
    shift
    local choice
    local options=("$@")
    local menu_height="${UI_MENU_HEIGHT:-5}"
    local cancel_label="${UI_CANCEL_LABEL:-"Exit"}"
    local backtitle="${EDITION_BACKTITLE:-$UI_BACKTITLE}"
    local width="${EDITION_DIALOG_WIDTH:-$UI_DIALOG_WIDTH}"
    local height="${EDITION_DIALOG_HEIGHT:-$UI_DIALOG_HEIGHT}"
    local tooltip="${EDITION_TOOLTIP:-$UI_UP_AND_DOWN_TOOLTIP}"

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
              --title "$title" \
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