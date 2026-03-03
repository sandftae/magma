#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the multi-selection of extra services
# ============================================================

# services orchestrates the checklist selection step
services() {
    local selected_ids
    local boilerplate=""

    # provide/source variable context from stack
    provideVarContext

    # build  template/boilerplate
    boilerplate=$(buildBoilerplate)

    # route to the UI with the prepared message
    if [[ "$(getAppConfig "uiMode")" == "gum" ]]; then
        selected_ids=$(uiMultiSelect "$boilerplate" "${SERVICES_LIST_GUM[@]}") || return $?
    else
        selected_ids=$(uiMultiSelect "$boilerplate" "${SERVICES_LIST[@]}") || return $?
    fi

    # save
    setStackData "selected_services" "$selected_ids"
}