# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set path
if [ -e /proc/version ] && grep -q arch /proc/version; then
    # arch
    export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/opt/intel/mediasdk/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:$PATH
elif [ -e /proc/version ] && grep -q ubuntu /proc/version; then
    # ubuntu
    export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/lib/x86_64-linux-gnu/libexec/kf5/:$PATH
else
    export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:$PATH
fi
typeset -aU path

export ZSH="/home/wwinfrey/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    alias-finder
    debian
    emacs
    extract
    gcloud
    git
    gpg-agent
    keychain
    kubectl
    pip
    pipenv
    systemadmin
    taskwarrior
    terraform
    themes
    timer
    vagrant
    zaw
    zsh-autosuggestions
    zsh-completions
    zsh_reload
    zsh-syntax-highlighting
)

zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_rsa_metalab-kubuntuhv CC242438F5841AA9

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# user configuration
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

# history options
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt NO_HIST_BEEP
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS

# alias-finder: run automatically
ZSH_ALIAS_FINDER_AUTOMATIC=true

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
