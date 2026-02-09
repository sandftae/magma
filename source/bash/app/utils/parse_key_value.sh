#!/bin/bash
# ============================================================
# NAMESPACE: Utils
# DESCRIPTION: parsing utilities for configuration strings
# ============================================================

# parses a string in format "Label|Value;Label|Value" into two separate arrays
parseKvOptions() {
    local raw="$1"
    local -n labelsRef="$2"
    local -n valuesRef="$3"
    local pair

    local IFS=';'
    read -ra pairs <<< "$raw"

    for pair in "${pairs[@]}"; do
        if [[ "$pair" == *"|"* ]]; then
            labelsRef+=( "${pair%|*}" )
            valuesRef+=( "${pair#*|}" )
        fi
    done
}