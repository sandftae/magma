#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the base stack configuration overview
# ============================================================

# base_stack_overview orchestrates the base configuration summary step
base_stack_overview() {
    local boilerplate=""

    # resolve and source dependencies dependencies
    platform_resolve_dependencies "$PLATFORM_VERSION" "$FRONTEND_TYPE"

    # build  template/boilerplate
    boilerplate=$(buildBoilerPlate)

    # route to the UI with the prepared message
    uiOverview "$boilerplate" || return $?
}