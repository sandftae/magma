#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum confirm
# ============================================================

# function uiRenderGumConfirm
uiRenderGumConfirm() {
    local message="$1"

    # gum confirm returns 0 for yes, 1 for no
    gum confirm "$message"
    local exitCode=$?

    case "$exitCode" in
        0)   return 0   ;;
        1)   return 1   ;;
        130) return 255 ;;
        *)   return 1   ;; # default to 'no'
    esac
}