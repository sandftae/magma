#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: allows user to select the platform edition
# ============================================================

# handles the platform edition selection process
edition() {
    local displayNames=()
    local technicalValues=()
    local choice

    # extract data
    parseKvOptions "$EDITION_RAW_OPTIONS" displayNames technicalValues

    choice=$(uiMenu "${displayNames[@]}") || return $?

    # associative array is used for instant lookup
    declare -A lookup
    for i in "${!displayNames[@]}"; do
        lookup["${displayNames[i]}"]="${technicalValues[i]}"
    done

    # get value or fallback
    local finalValue="${lookup[$choice]:-$EDITION_DEFAULT}"

    # save
    setStackData "platform_edition" "$finalValue"
}