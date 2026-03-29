# ========== Visual Output ==========

_update_ps1() {
    _branch_str=$(gBranch)
    PS1="${F_WHT}\u@\h ${F_CYN}\W/ => ${_branch_str}${RS}\$ "
}

PROMPT_COMMAND='_update_ps1; '"${PROMPT_COMMAND}"
[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)"
