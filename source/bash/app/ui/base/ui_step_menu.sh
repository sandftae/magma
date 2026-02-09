#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: function to handle key-value selection
# ============================================================

# Generic function to handle key-value selection and state persistence
uiStepMenu() {
    local raw_options="$1"
    local stack_key="$2"
    local default_value="$3"

    local choice finalValue displayNames=() technicalValues=()

    # extract version labels and technical values
    parseKvOptions "$raw_options" displayNames technicalValues

    # show menu
    choice=$(uiMenu "${displayNames[@]}") || return $?

    # associative array is used for instant lookup
    declare -A lookup
    for i in "${!displayNames[@]}"; do
        lookup["${displayNames[i]}"]="${technicalValues[i]}"
    done

    # resolve value with fallback and save to stack
    finalValue="${lookup[$choice]:-$default_value}"

    setStackData "$stack_key" "$finalValue"
}