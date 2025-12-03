fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

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
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
export PROJ_DIR=$(brew --prefix proj)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
