#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders dialog checklist for multiple selection
# ============================================================

# renders a dialog checklist with pre-checked items and high-performance mapping
uiRenderDialogMultiSelect() {
    local message="$1"
    shift
    local options=("$@")
    local -A label_to_id
    local dialog_list=()
    local iterator id label status config_prefix
    local title_var height_var width_var
    local chosen_labels chosen
    local result_ids=()

    config_prefix=$(getAppConfig "step" | tr '[:lower:]' '[:upper:]')
    title_var="${config_prefix}_MENU_TITLE"
    height_var="${config_prefix}_DIALOG_HEIGHT"
    width_var="${config_prefix}_DIALOG_WIDTH"

    for ((iterator=0; iterator<${#options[@]}; iterator+=3)); do
        id="${options[iterator]}"
        label="${options[iterator+1]}"
        status="${options[iterator+2]^^}" # ON/OFF

        dialog_list+=("$id" "$label" "$status")
        label_to_id["$id"]="$id"
    done

    # execute
    chosen_labels=$(dialog --clear --colors \
        --backtitle "$UI_BACKTITLE" \
        --title "$(formatToTitleCase "${!title_var:-Services Selection}")" \
        --cancel-label "$UI_BACK_LABEL" \
        --checklist "$message" \
        "${!height_var:-18}" "${!width_var:-75}" 10 \
        "${dialog_list[@]}" 2>&1 >/dev/tty) || return $?

    for chosen in $chosen_labels; do
        chosen=$(printf '%s' "$chosen" | tr -d '"')
        [[ -n "$chosen" ]] && result_ids+=("${label_to_id[$chosen]}")
    done

    printf '%s' "${result_ids[*]}"

    # success
    return 0
}