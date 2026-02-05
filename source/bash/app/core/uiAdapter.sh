#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles ui mode selection and abstraction
# ============================================================

# asks user to select preferred UI mode
uiSelectMode() {
    local choice
    local header_text
    header_text="How would you like to do the $(printf "%bstep-by-step setup?%b" "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}")"

    # clear just a little bit
    clear

    # hero section
    gum style \
          --foreground "$COLOR_PRIMARY" \
          --border double \
          --border-foreground "$COLOR_ACCENT" \
          --align center --width 60 --margin "1 2" --padding "0 1" \
          "$APP_TITLE"

    # just visual effects, nothing more
    gum spin \
        --spinner.margin "0 0 0 3" \
        --spinner.padding "0 0 0 0" \
        --spinner.foreground "$COLOR_SPINNER_ACCENT" \
        --title " Preparing builder ..." \
        -- sleep 0.7

    # interaction with proper indentation
    choice=$(gum choose \
        --header "$header_text" \
        --header.margin "0 0 0 3" \
        --item.margin "0 0 0 3" \
        --item.padding "0 0 0 0" \
        --selected.margin "0 0 0 3" \
        --cursor.padding="0 3 0 0" \
        --cursor="   >" \
        --selected.foreground="$COLOR_ACCENT" \
        "$LABEL_MODERN" "$LABEL_CLASSIC")

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