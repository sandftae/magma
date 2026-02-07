#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: Platform
# DESCRIPTION: Resolves versions using variable indirection
# ============================================================

# platform_resolve_dependencies populates local variables
platform_resolve_dependencies() {
    local commerce_version="$1" # e.g., 2.4.8
    local frontend_type="$2"    # e.g., monolith

    # x.x.x -> x_x_x
    local version_suffix="${commerce_version//./_}"
    local frontend_key="${frontend_type^^}" # MONOLITH

    # build var names
    local php_var_name="PHP_MAP_${version_suffix}"
    local mysql_var_name="MYSQL_MAP_${version_suffix}"
    local os_var_name="OS_MAP_${version_suffix}"
    local fe_var_name="FE_TITLE_${frontend_key}"

    # extract var into context
    PHP_VERSION="${!php_var_name:-Unknown}"
    MYSQL_VERSION="${!mysql_var_name:-8.0}"
    OPEN_SEARCH_VERSION="${!os_var_name:-2.x}"
    FRONTEND_TYPE="${!fe_var_name:-Default/Monolith}"

    # alias
    MYSQL="$MYSQL_VERSION"
}