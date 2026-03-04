#!/bin/bash
# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: manages the variable context for UI templates
# ============================================================

# provideVarContext extracts stack data into the local caller scope
provideVarContext() {
    local should_resolve_services="${1:-false}"
    local keys key value

    keys=$(getStackDataKeys)

    for key in $keys; do
        local value
        value=$(getStackData "$key")

        if [[ "${value,,}" == "ee" || "${value,,}" == "ce" ]]; then
            value="${value^^}"
        fi

        printf -v "${key^^}" '%s' "$value"
    done

    if [[ "$should_resolve_services" == true ]]; then
        # add to context services by code
        SERVICES=$(_resolveServiceLabels "$SELECTED_SERVICES")
        : "$SERVICES"
    fi
}

# resolveServiceLabels converts space-separated IDs into a formatted label string
_resolveServiceLabels() {
    local input_ids="$1"
    local service_id i count=0 result=""
    local -A id_to_label
    local mode br=$'\n                           '

    mode=$(getAppConfig "uiMode")
    # it is slightly different for gum
    if [[ "$mode" == "gum" ]]; then
            br="\\n                           "
        fi

    for ((i=0; i<${#SERVICES_LIST[@]}; i+=2)); do
        id_to_label["${SERVICES_LIST[i]}"]="${SERVICES_LIST[i+1]}"
    done

    for service_id in $input_ids; do
        [[ -z "${id_to_label[$service_id]}" ]] && continue
        ((count++))

        local sep=""
        [[ $count -gt 1 ]] && {
            (( (count - 1) % 5 == 0 )) && sep="$br" || sep=", "
        }

        result+="${sep}${id_to_label[$service_id]}"
    done

    printf '%s' "$result"
}