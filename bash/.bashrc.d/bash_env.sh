# ========== Editors ==========
export EDITOR="nvim"
export VISUAL="nvim"

# ========== Node.js ==========
export NODE_ENV="development"

# ========== History config ==========
export HISTIGNORE="ls:cd:pwd:exit:rm:mkdir"
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a; '"${PROMPT_COMMAND}"

# ========== Shell options ==========
shopt -s histappend
shopt -s cdspell
shopt -s autocd
shopt -s checkwinsize
shopt -s globstar
