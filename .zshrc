export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH="/usr/local/opt/openssl/bin:$PATH"

if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi

eval $(/usr/libexec/path_helper -s)

zplug "b4b4r07/enhancd", use:'init.sh'
zplug "mollifier/anyframe"

zplug "modules/environment", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/history", from:prezto
zplug "modules/git", from:prezto
zplug "modules/rails", from:prezto
zplug "zsh-users/zsh-autosuggestions"

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

zstyle ':prezto:module:terminal' auto-title 'yes'

# http://www.tellme.tokyo/entry/2016/12/20/110000
do_enter() {
    if [[ -n $BUFFER ]]; then
        zle accept-line
        return $status
    fi

    echo
    if [[ -d .git ]]; then
        if [[ -n "$(git status --short)" ]]; then
            git status
        fi
    else
        # do nothing
        :
    fi

    zle reset-prompt
}

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey -e
bindkey '^b' anyframe-widget-cdr
bindkey '^r' anyframe-widget-put-history
bindkey '^z' anyframe-widget-put-history
# bindkey '^R' anyframe-widget-execute-history
bindkey '^g' anyframe-widget-checkout-git-branch
zle -N do_enter
bindkey '^m' do_enter

export EDITOR='mvim -v'
export VISUAL='mvim -v'

alias r='rails'
alias g='git'
alias s='git status'
alias t='tig'
alias v='mvim -v'
alias be='bundle exec'
alias re='rbenv exec'

alias reload='exec zsh -l'
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

GEOMETRY_PROMPT_PLUGINS=(exec_time git)

export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks

