#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the service selection branching
# ============================================================

# services_prompt orchestrates the decision between adding more services or finishing
services_prompt() {
    local boilerplate=""
    local raw_boilerplate=""

    # provide/source variable context from stack
    provide_var_context

    # build  template/boilerplate
    raw_boilerplate=$(provide_boilerplate)
    boilerplate=$(build_template "$raw_boilerplate")

    uiYesNo "$boilerplate"

    return $?
}