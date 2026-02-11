#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders yes/no prompt using dialog extra-button
# ============================================================

  # uiRenderDialogYesNo displays a 'yes/no' menu
uiRenderDialogYesNo() {
    local message="$1" raw_prefix="" config_prefix=""

    raw_prefix=$(getAppConfig "step")
    config_prefix="${raw_prefix^^}"

    local title_var="${config_prefix}_MENU_TITLE"
    local no_label_var="${config_prefix}_NO_LABEL"
    local yes_label_var="${config_prefix}_YES_LABEL"
    local height_var="${config_prefix}_DIALOG_HEIGHT"
    local back_title_var="${config_prefix}_BACKTITLE"
    local extra_label_var="${config_prefix}_EXTRA_LABEL"

    dialog --clear \
       --colors \
       --backtitle "${!back_title_var:-$UI_BACKTITLE}" \
       --title "${!title_var:-SELECT}" \
       --extra-button \
       --no-label "${!yes_label_var:-$UI_OK_LABEL}" \
       --yes-label "${!no_label_var:-$UI_BACK_LABEL}" \
       --extra-label "${!extra_label_var:-$UI_EXTRA_LABEL}" \
       --yesno "$message" "${!height_var:-15}" 70

    local exit_code=$?

    case $exit_code in
        0)        return 10 ;;    # <- 'No, Im Good'
        1)        return 1  ;;    # <- 'Back'
        3)        return 0  ;;    # <- 'Add Services'
        255 | *)  return 255 ;;   # <- handle ESC / CTRL + C || unrecognizable error
    esac
}