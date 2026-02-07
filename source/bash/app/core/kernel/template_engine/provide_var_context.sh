# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: manages the variable context for UI templates
# ============================================================

# provide_var_context extracts stack data into the local caller scope
provide_var_context() {
    local keys
    keys=$(getStackKeys)

    for key in $keys; do
        local value
        value=$(getStackData "$key")

        if [[ "${value,,}" == "cc" || "${value,,}" == "ce" ]]; then
            value="${value^^}"
        fi

        printf -v "${key^^}" '%s' "$value"
    done
}