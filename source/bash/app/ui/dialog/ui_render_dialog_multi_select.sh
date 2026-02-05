#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog checklist for multiple selection
# ============================================================

# function uiRenderDialogMultiSelect
uiRenderDialogMultiSelect() {
    local title="$1"
    shift
    local options=("$@")
    local dialogOptions=()

    # format options for dialog checklist: "Tag" "Description" "Status"
    for opt in "${options[@]}"; do
        dialogOptions+=("$opt" "" "off")
    done

    local choices
    choices=$(dialog --clear --title "$title" \
                    --separate-output \
                    --checklist "Select services (Space to toggle):" 15 60 8 \
                    "${dialogOptions[@]}" 3>&1 1>&2 2>&3)
    local exitCode=$?

    case "$exitCode" in
        0)
            # dialog with --separate-output returns items on new lines
            echo "$choices" | tr '\n' ' ' | sed 's/ *$//'
            return 0
            ;;
        1)   return 1   ;; # back
        255) return 255 ;; # esc
    esac
}