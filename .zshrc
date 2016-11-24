export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH="/usr/local/share/npm/bin:$PATH"


zplug "b4b4r07/enhancd"
zplug "mollifier/anyframe"

zplug "modules/environment", from:prezto
zplug "modules/history", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/git", from:prezto
zplug "modules/rails", from:prezto

zplug "frmendes/geometry"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load --verbose

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^b' anyframe-widget-cdr
bindkey '^r' anyframe-widget-put-history
bindkey '^z' anyframe-widget-put-history
bindkey '^e' anyframe-widget-execute-history
bindkey '^g' anyframe-widget-checkout-git-branch


alias r='rails'
alias g='git'
alias t='tig'
alias v='vim'
alias be='bundle exec'