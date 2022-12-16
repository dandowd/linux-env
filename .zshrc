export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [ -f ~/Projects/hellotill-platform/hellotill-platform.sh ]; then
  . ~/Projects/hellotill-platform/hellotill-platform.sh
fi

eval "$(starship init zsh)"
alias ls=exa

export AWS_SDK_LOAD_CONFIG=1

bindkey -v
