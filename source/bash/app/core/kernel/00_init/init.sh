#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: initializes global arrays for step management
# ============================================================

# IDs of steps (used for loading configs: edition_select, domain_config, etc.)
declare -a __APP_STEP_IDS

# Function names of steps (edition, domain, services, etc.)
declare -a __APP_STEPS