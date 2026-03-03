#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the service selection branching
# ============================================================

# services_prompt orchestrates the decision between adding more services or finishing
services_prompt() {
    local boilerplate=""

    # provide/source variable context from stack
    provideVarContext

    # build  template/boilerplate
    boilerplate=$(buildBoilerplate)

    uiYesNo "$boilerplate" || return $?
}