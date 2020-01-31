# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/opt/intel/mediasdk/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:$PATH
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

# export MANPATH="/usr/local/man:$MANPATH"
# example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

# alias-finder: run automatically
ZSH_ALIAS_FINDER_AUTOMATIC=true

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
