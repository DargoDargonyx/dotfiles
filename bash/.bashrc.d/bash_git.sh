# ========== Aliases ==========

alias gs="git status"
alias gb="git checkout -b"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias gds="git diff --staged"


# ========== Functions ==========

# Usage: gConf <scope>
gConf() {
    case "$1" in
        global|local|system) ;;
        *) echo "Usage: gConf <global|local|system>"; return 1 ;;
    esac

    git config --$1 user.name "DargoDargonyx"
    git config --$1 user.email "dargodargonyx@outlook.com"

    git config --$1 init.defaultBranch main
    git config --$1 core.editor "nvim"
    git config --$1 color.ui auto

    git config --$1 pull.rebase false
    git config --$1 push.autoSetupRemote true
    git config --$1 fetch.prune true
}


# Usage: gBranch
gBranch() {
    local branch=""
    if git rev-parse --git-dir &>/dev/null; then
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        if [ -n "$branch" ]; then
            if git diff --quiet 2>/dev/null && git diff --cached --quiet 2>/dev/null; then
                echo -n "${F_GRN}(${branch}) ${RS}"
            else
                echo -n "${F_YEL}(${branch}*) ${RS}"
            fi
        fi
    fi
}
