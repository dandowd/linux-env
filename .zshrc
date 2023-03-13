fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

if [ -f ~/Projects/hellotill-platform/hellotill-platform.sh ]; then
  . ~/Projects/hellotill-platform/hellotill-platform.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/Users/daniel.dowd/.nvm/versions/node/v16.19.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/daniel.dowd/Library/Python/3.9/bin"

alias ls=exa

export AWS_SDK_LOAD_CONFIG=1

bindkey -v
alias python=/usr/bin/python3

export FZF_DEFAULT_COMMAND='fd --color always --type file --strip-cwd-prefix --hidden --follow -E .git -E node_modules'
alias ff="fzf --print0 --ansi | xargs -0 -o nvim -c 'cd %:h'"


function directory_find() {
  dirs=$(fd --color always --type directory -E node_modules $@ | fzf --ansi)
  if [ $? -eq 0 ]
  then
    cd "$dirs"
  fi
}
alias df=directory_find


alias zshrc="nvim ~/.zshrc"

alias projects="cd ~/Projects"

alias lg="lazygit"

function rip_grep_find() {
	rg -l $@ | fzf --print0 --ansi --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -0 -o nvim
}
alias rgf=rip_grep_find
