#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles ui mode selection and abstraction
# ============================================================

# asks user to select preferred UI mode
uiSelectMode() {
    local choice

    # clear just a little bit
    clear

    # hero section
    gum style \
        --foreground "$COLOR_PRIMARY" \
        --border double \
        --border-foreground "$COLOR_ACCENT" \
        --align center \
        --width 82 \
        --margin "1 2" \
        --padding "0 1" \
        "$APP_LOGO"

    # just visual effects, nothing more
    gum spin --spinner "$UI_SPINNER_TYPE" --title " Preparing setup modules..." -- sleep 0.6

    # interaction
    choice=$(gum choose --header "Select your configuration style:" "$LABEL_MODERN" "$LABEL_CLASSIC")
    local exitCode=$?

    [[ $exitCode -eq 130 || -z "$choice" ]] && {
        processTerminated
        return 1
    }

    # routing
    case "$choice" in
        "$LABEL_MODERN")  setAppConfig "uiMode" "gum" ;;
        "$LABEL_CLASSIC") setAppConfig "uiMode" "dialog" ;;
    esac

    return 0
}