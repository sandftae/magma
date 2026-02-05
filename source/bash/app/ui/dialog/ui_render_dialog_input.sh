#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog inputbox with a validation loop
# ============================================================

uiRenderDialogInput() {
    local title="$1"
    local value="$2"
    local validator="$3"
    local userInput
    local exitCode
    local errorMessage

    while :; do
        userInput=$(dialog --clear --title "$title" \
                        --inputbox "Enter value:" 10 60 "$value" \
                        3>&1 1>&2 2>&3)
        exitCode=$?

        case "$exitCode" in
            1)   return 1   ;; # back/cancel
            255) return 255 ;; # esc
        esac

        # if no validator, return immediately
        [[ -z "$validator" ]] && { printf '%s' "$userInput"; return 0; }

        # run validation
        errorMessage=$($validator "$userInput")

        # if valid, return
        [[ -z "$errorMessage" ]] && { printf '%s' "$userInput"; return 0; }

        # show error box and repeat
        dialog --title " ERROR " --msgbox "$errorMessage" 8 50
        value="$userInput"
    done
}