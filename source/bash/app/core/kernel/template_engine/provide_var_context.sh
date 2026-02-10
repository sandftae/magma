# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: manages the variable context for UI templates
# ============================================================

# provideVarContext extracts stack data into the local caller scope
provideVarContext() {
    local keys
    keys=$(getStackDataKeys)

    for key in $keys; do
        local value
        value=$(getStackData "$key")

        if [[ "${value,,}" == "ee" || "${value,,}" == "ce" ]]; then
            value="${value^^}"
        fi

        printf -v "${key^^}" '%s' "$value"
    done
}