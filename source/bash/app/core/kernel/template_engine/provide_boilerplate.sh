# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: provides a template/boilerplate
# ============================================================

# provide_boilerplate returns a mode-specific template
provide_boilerplate() {
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