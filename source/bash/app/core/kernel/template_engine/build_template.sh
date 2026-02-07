#!/bin/bash
# ============================================================
# NAMESPACE: Template Engine
# DESCRIPTION: engine for building and interpolating templates
# ============================================================

# build_template resolves variable placeholders within a string
build_template() {
    local template="$1"
    eval "cat <<EOF
$template
EOF"
}