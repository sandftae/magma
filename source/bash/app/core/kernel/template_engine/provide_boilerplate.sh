# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: provides a template/boilerplate
# ============================================================

# provide_boilerplate returns a mode-specific template
provide_boilerplate() {
    local config_prefix="${1^^}"
    local ui_mode

    # extract session mode
    ui_mode=$(getAppConfig "uiMode")

    # map suffix
    local suffix=""
    [[ "$ui_mode" == "gum" ]] && suffix="_GUM"

    # construct template variable name
    local template_var="${config_prefix}_TOTAL_MESSAGE${suffix}"

    # return the content
    printf '%s' "${!template_var}"
}