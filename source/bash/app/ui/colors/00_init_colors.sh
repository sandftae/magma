#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: standard color definitions for Dialog and ANSI
# ============================================================

# dialog specific codes (\Z)
COLOR_RED='\Z1'
COLOR_YELLOW='\Z3'
COLOR_BOLD='\Zb'
COLOR_NORMAL='\Zn'
COLOR_MAGENTA='\Z5'
COLOR_GREEN='\Z2'
COLOR_BLACK='\Z0'
COLOR_CYAN='\Z6'

# standard ANSI codes
ANSI_COLOR_RED='\e[31m'
ANSI_COLOR_GREEN='\e[32m'
ANSI_COLOR_YELLOW='\e[33m'
ANSI_COLOR_MAGENTA='\e[35m'
ANSI_COLOR_CYAN='\e[36m'
ANSI_COLOR_BLACK='\e[30m'
ANSI_COLOR_BOLD='\e[1m'
ANSI_COLOR_NORMAL='\e[0m'
ANSI_COLOR_DIM="\033[2m"
