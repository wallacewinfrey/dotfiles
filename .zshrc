# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set path
if [ -f /usr/lib/os-release ]; then
    # we're on arch, set path accordingly
    export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/opt/intel/mediasdk/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:$PATH
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
    terraform
    vagrant
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_rsa_metalab-kubuntuhv CC242438F5841AA9

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# user configuration
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

# alias-finder: run automatically
ZSH_ALIAS_FINDER_AUTOMATIC=true

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
