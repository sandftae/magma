#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog yesno box
# ============================================================

# function uiRenderDialogConfirm
uiRenderDialogConfirm() {
    local message="$1"

    dialog --clear --title " CONFIRMATION " \
           --yesno "$message" 8 50
    local exitCode=$?

    case "$exitCode" in
        0)   return 0   ;; # Yes
        1)   return 1   ;; # No
        255) return 255 ;; # Esc
    esac
}