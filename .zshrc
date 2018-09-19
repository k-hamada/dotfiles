export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
source $HOME/.cargo/env

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"
export PATH="/Users/khamada/google-cloud-sdk/bin:$PATH"


if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi

# eval $(/usr/libexec/path_helper -s)

zplug 'supercrabtree/k', use:'!*'
zplug "b4b4r07/enhancd", use:'init.sh'
zplug "mollifier/anyframe"
zplug "marzocchi/zsh-notify"

zplug "modules/environment", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/history", from:prezto
zplug "modules/git", from:prezto
# zplug "modules/rails", from:prezto
zplug "zsh-users/zsh-autosuggestions"

GEOMETRY_SYMBOL_PROMPT="*'-'ﾉ"
GEOMETRY_SYMBOL_EXIT_VALUE='*;-;ﾉ'
GEOMETRY_SYMBOL_RPROMPT="< "
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
GEOMETRY_PROMPT_PLUGINS=(git)
zplug "frmendes/geometry", hook-load:"geometry_plugin_register datetime"

# https://github.com/desyncr/geometry-datetime/blob/master/plugin.zsh
GEOMETRY_PLUGIN_DATETIME_FORMAT="+%T"
GEOMETRY_PLUGIN_DATETIME_PREFIX=":: "
GEOMETRY_PLUGIN_DATETIME_SUFFIX=""
geometry_prompt_datetime_setup() {
}
geometry_prompt_datetime_render() {
  echo ${GEOMETRY_PLUGIN_DATETIME_PREFIX}$(date $GEOMETRY_PLUGIN_DATETIME_FORMAT)${GEOMETRY_PLUGIN_DATETIME_SUFFIX}
}


# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   else
#     echo
#   fi
# fi
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

k() {
  unfunction k
  . "${ZPLUG_REPOS}/supercrabtree/k/k.sh"
  k "$@"
}

if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi

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

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export GIT_EDITOR='vim'

alias r='rails'
alias g='git'
alias s='git status'
alias t='tig'
alias v='mvim -v'
alias be='bundle exec'
alias re='rbenv exec'
alias l='exa'
alias ls='exa'
alias ll='exa -l'

alias kube=kubectl

alias reload='exec zsh -l'
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export HISTSIZE=10000000
export SAVEHIST=10000000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks

