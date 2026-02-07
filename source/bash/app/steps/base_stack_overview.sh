#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the base stack configuration overview
# ============================================================

# base_stack_overview orchestrates the base configuration summary step
base_stack_overview() {
    local boilerplate=""
    local raw_boilerplate=""
    local step_prefix="base_stack_overview"

    # provide/source variable context from stack
    provide_var_context

    # resolve and source dependencies dependencies
    platform_resolve_dependencies "$PLATFORM_VERSION" "$FRONTEND_TYPE"

    # build  template/boilerplate
    raw_boilerplate=$(provide_boilerplate "$step_prefix")
    boilerplate=$(build_template "$raw_boilerplate")

    # route to the UI with the prepared message
    uiOverview "$step_prefix" "$boilerplate"
    local exitCode=$?

    # handle navigation based on exit codes
    [[ $exitCode -eq 255 ]] && return 255 # Exit (Esc/Ctrl+C)
    [[ $exitCode -eq 1 ]] && return 1     # Go Back

    return 0
}