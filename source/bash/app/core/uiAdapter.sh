#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles ui mode selection and abstraction
# ============================================================

# asks user to select preferred UI mode
uiSelectMode() {
    local choice

    # check if gum is installed
    command -v gum >/dev/null 2>&1 || {
        setAppConfig "uiMode" "dialog"
        return 0
    }

    # using gum for the initial choice
    choice=$(gum choose --header "Select Interface Mode" "Gum CLI" "Bash Dialog")
    local exitCode=$?

    # handle esc or ctrl+c (gum returns 130 for sigint)
    [[ $exitCode -eq 130 ]] && {
        processTerminated
        return 1
    }

    case "$choice" in
        "Gum CLI")      setAppConfig "uiMode" "gum" ;;
        "Bash Dialog")  setAppConfig "uiMode" "dialog" ;;
        "")             processTerminated; return 1 ;;
    esac

    return 0
}