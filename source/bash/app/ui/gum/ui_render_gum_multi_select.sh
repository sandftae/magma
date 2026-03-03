#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders gum choose with multi-select enabled
# ============================================================

# renders a gum selection menu with pre-checked items
uiRenderGumMultiSelect() {
    local title="$1"
    shift
    local options=("$@")

    local -A label_to_id
    local display_list=()
    local selected_items=()

    local iterator id label status
    local joined_selected formatted_header
    local chosen_labels chosen
    local result_ids=()

    for ((iterator=0; iterator<${#options[@]}; iterator+=3)); do
        id="${options[iterator]}"
        label="${options[iterator+1]}"
        status="${options[iterator+2]^^}"

        display_list+=("$label")
        label_to_id["$label"]="$id"

        [[ "$status" == "ON" ]] && selected_items+=("$label")
    done

    joined_selected=$(IFS=,; printf '%s' "${selected_items[*]}")
    formatted_header=$(printf '%s' "$title" | gum format --type template)

    chosen_labels=$(gum choose --no-limit \
        --header "$formatted_header" \
        --cursor=" > " \
        --cursor.foreground="$COLOR_ACCENT" \
        --cursor.bold \
        --selected.foreground="$COLOR_ACCENT" \
        --selected.bold \
        --selected "$joined_selected" \
        "${display_list[@]}") || return $?

    while IFS= read -r chosen; do
        [[ -n "$chosen" ]] && result_ids+=("${label_to_id[$chosen]}")
    done <<< "$chosen_labels"

    printf '%s' "${result_ids[*]}"

    # success
    return 0
}