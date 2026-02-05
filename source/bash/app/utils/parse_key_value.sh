#!/bin/bash
# ============================================================
# NAMESPACE: Utils
# DESCRIPTION: parsing utilities for configuration strings
# ============================================================

# parses a string in format "Label|Value;Label|Value" into two separate arrays
parseKvOptions() {
    local raw="$1"
    local -n labelsRef="$2"  # reference to labels array
    local -n valuesRef="$3"  # reference to technical values array

    IFS=';' read -ra pairs <<< "$raw"
    for pair in "${pairs[@]}"; do
        IFS='|' read -r label value <<< "$pair"
        labelsRef+=("$label")
        valuesRef+=("$value")
    done
}