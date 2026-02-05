#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: concrete implementation of menu using bash dialog
# ============================================================

# uiRenderDialogMenu
uiRenderDialogMenu() {
    local title="$1"
    shift
    local options=("$@")

    # format options for dialog
    local dialogOptions=()
    for opt in "${options[@]}"; do
        dialogOptions+=("$opt" "")
    done

    # execute dialog and capture output to a temporary descriptor
    local choice
    choice=$(dialog --clear --title "$title" \
                    --cancel-label "Back" \
                    --menu "Choose an option:" 15 60 5 \
                    "${dialogOptions[@]}" 3>&1 1>&2 2>&3)
    local exitCode=$?

    # handle results
    case "$exitCode" in
        0) printf '%s' "$choice"; return 0 ;;
        1) return 1 ;; # back button
        255) return 255 ;; # esc
    esac
}