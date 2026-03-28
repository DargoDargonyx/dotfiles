#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


BASHRC_D=$HOME/.bashrc.d

# Variable Constants
[ -f "$BASHRC_D/bash_constants.sh" ] && . "$BASHRC_D/bash_constants.sh"
# Environment
[ -f "$BASHRC_D/bash_env.sh" ] && . "$BASHRC_D/bash_env.sh"
# Aliases
[ -f "$BASHRC_D/bash_aliases.sh" ] && . "$BASHRC_D/bash_aliases.sh"
# Functions
[ -f "$BASHRC_D/bash_functions.sh" ] && . "$BASHRC_D/bash_functions.sh"
# Git related stuff
[ -f "$BASHRC_D/bash_git.sh" ] && . "$BASHRC_D/bash_git.sh"
# Prompt customization
[ -f "$BASHRC_D/bash_prompt.sh" ] && . "$BASHRC_D/bash_prompt.sh"
# Optional completions
[ -f "$BASHRC_D/bash_completions.sh" ] && . "$BASHRC_D/bash_completions.sh"
