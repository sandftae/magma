#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: State
# DESCRIPTION: initializes global storage for the application
# ============================================================

# initialize global associative arrays
declare -g -A __STACK_DATA
declare -g -A __APP_CONFIG

# make dialog/ui respond to ESC immediately instead of waiting
export ESCDELAY=0
