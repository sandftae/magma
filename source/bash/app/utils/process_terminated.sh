# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles graceful termination message
# ============================================================

# show 'terminated' message
processTerminated() {
    gum style --foreground 210 "Process terminated by user. See you next time!"
}