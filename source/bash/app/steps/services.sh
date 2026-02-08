#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the multi-selection of extra services
# ============================================================

# services orchestrates the checklist selection step
services() {
    local selected_ids
    local boilerplate=""
    local raw_boilerplate=""

    # provide/source variable context from stack
    provide_var_context

    # build  template/boilerplate
    raw_boilerplate=$(provide_boilerplate)
    boilerplate=$(build_template "$raw_boilerplate")

    # # route to the UI with the prepared args
    selected_ids=$(uiMultiSelect "$boilerplate" "${SERVICES_LIST[@]}")
    local exitCode=$?

    # save
    setStackData "selected_services" "$selected_ids"

    # navigation
    [[ $exitCode -eq 255 ]] && return 255
    [[ $exitCode -eq 1 ]] && return 1

    return 0
}