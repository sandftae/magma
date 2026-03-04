#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the multi-selection of extra services
# ============================================================

# services orchestrates the checklist selection step
services() {
    local ui_mode selected_ids list_var_name boilerplate=""

    # provide/source variable context from stack
    provideVarContext

    # build  template/boilerplate
    boilerplate=$(buildBoilerplate)

    ui_mode=$(getAppConfig "uiMode")

    # either GUM or DIALOG
    list_var_name="SERVICES_LIST_${ui_mode^^}"

    declare -n target_list="$list_var_name"

    selected_ids=$(uiMultiSelect "$boilerplate" "${target_list[@]}") || return $?

    # save
    setStackData "selected_services" "$selected_ids"
}