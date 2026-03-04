#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the final stack configuration overview
# ============================================================

# final_stack_overview orchestrates the final configuration summary step
final_stack_overview() {
    local boilerplate="" withServices=true

    # provide/source variable context from stack with services labels
    provideVarContext $withServices

    # resolve and source dependencies dependencies
    platform_resolve_dependencies "$PLATFORM_VERSION" "$FRONTEND_TYPE"

    # build  template/boilerplate
    boilerplate=$(buildBoilerplate)

    # route to the UI with the prepared message
    uiOverview "$boilerplate" || return $?
}