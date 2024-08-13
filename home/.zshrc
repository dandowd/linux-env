fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

export AWS_SDK_LOAD_CONFIG=1

bindkey -v

export FZF_DEFAULT_COMMAND='fd --color always --type file --strip-cwd-prefix --hidden --follow -E .git -E node_modules'

function find_file() {
  relative_file_loc=$(fzf --print0 --ansi --preview 'bat --style=numbers --color=always --line-range :500 {}')
  
  echo $relative_file_loc
  nvim $relative_file_loc
}
alias ff=find_file

function directory_find() {
  dirs=$(fd --color always --type directory -E node_modules $@ | fzf --ansi)
  if [ $? -eq 0 ]
  then
    cd "$dirs"
  fi
}
alias df=directory_find
alias gitd='cd $(git rev-parse --show-toplevel)'

export HUSKY=0
export EDITOR=nvim

alias zshrc="nvim ~/.zshrc"

function projects() {
  dir=$1
  
  if [ -z "$dir" ]
  then
    cd ~/Projects
  else
    cd ~/Projects/$dir
  fi
}

alias lg="lazygit"

function rip_grep_find() {
	rg -l $@ | fzf --print0 --ansi --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -0 -o nvim
}

alias rgf=rip_grep_find

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias njs="nvim -u ~/.config/nvim/js.lua"

bindkey -v
bindkey '^R' history-incremental-search-backward

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/danieldowd/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias cd=__zoxide_z
\builtin alias cdi=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
 eval "$(zoxide init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
