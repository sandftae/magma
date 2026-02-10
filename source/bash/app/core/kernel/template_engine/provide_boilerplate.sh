# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: provides a template/boilerplate
# ============================================================

# provideBoilerplate returns a mode-specific template
provideBoilerplate() {
    local ui_mode
    local config_prefix=""

    config_prefix="$(getAppConfig "step")"
    config_prefix="${config_prefix^^}"

    # extract session mode
    ui_mode=$(getAppConfig "uiMode")

    # map suffix
    local suffix=""
    [[ "$ui_mode" == "gum" ]] && suffix="_GUM"

    # construct template variable name
    local boilerplate="${config_prefix}_TOTAL_MESSAGE${suffix}"

    # return the content
    printf '%s' "${!boilerplate}"
}