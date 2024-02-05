fpath+=("$(brew --prefix)/share/zsh/site-functions")
export PATH=$PATH:$(go env GOPATH)/bin

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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias njs="nvim -u ~/.config/nvim/js.lua"
alias ngo="nvim -u ~/.config/nvim/go.lua"

bindkey -v
bindkey '^R' history-incremental-search-backward

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/danieldowd/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
