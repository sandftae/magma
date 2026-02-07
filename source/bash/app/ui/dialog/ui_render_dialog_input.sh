#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog input-box with a validation loop
# ============================================================

uiRenderDialogInput() {
    local exit_code
    local user_input
    local error_message
    local validator="$2"
    local raw_prefix="$1"
    local config_prefix="${raw_prefix^^}"
    local back_title_var="${config_prefix}_BACKTITLE"
    local menu_title_var="${config_prefix}_MENU_TITLE"
    local back_label_var="${config_prefix}_BACK_LABEL"
    local default_value_var="${config_prefix}_DEFAULT_VALUE"
    local menu_content_var="${config_prefix}_MENU_BOX_CONTENT"

    local back_title="${!back_title_var:-$UI_BACKTITLE}"
    local back_label="${!back_label_var:-$UI_BACK_LABEL}"
    local value="${!default_value_var:-$UI_DEFAULT_VALUE}"
    local menu_title="${!menu_title_var:-$UI_CONFIGURATION_LABEL}"
    local menu_content="${!menu_content_var:-$UI_INPUT_MENU_BOX_CONTENT}"

    while :; do
        user_input=$(dialog --clear \
            --colors \
            --title "$menu_title" \
            --backtitle "$back_title" \
            --cancel-label "$back_label" \
            --inputbox "$menu_content" 15 60 "$value" \
            3>&1 1>&2 2>&3)

        exit_code=$?

        case "$exit_code" in
            1)   return 1   ;; # back/cancel
            255) return 255 ;; # esc
        esac

        # if no validator, return immediately
        [[ -z "$validator" ]] && { printf '%s' "$user_input"; return 0; }

        # run validation
        error_message=$($validator "$user_input")

        # show error message box
        [[ -n "$error_message" ]] && {
            dialog --clear \
                   --title " ERROR " \
                   --msgbox "\n\n          $error_message" 8 50 >&2

            value="$user_input"
            continue
        }

        # show error box and repeat
        printf '%s' "$user_input"
        return 0
    done
}