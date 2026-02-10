#!/bin/bash
# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: build boilerplate/template
# ============================================================

# build boilerplate/template
buildBoilerPlate() {
    local raw_boilerplate boilerplate

    # provide/source variable context from stack
    provideVarContext

    # build template/boilerplate
    raw_boilerplate=$(provideBoilerplate)

    # process the template using eval and heredoc for variable expansion
    boilerplate=$(eval "cat <<EOF
$raw_boilerplate
EOF"
)

    # return the processed boilerplate
    printf '%s' "$boilerplate"
}