# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# zmodload zsh/zprof # top of your .zshrc file

# Path to your oh-my-zsh installation.
export ZSH="/home/limkaleb/.oh-my-zsh"

ZSH_THEME=""
# ZSH_THEME="robbyrussell"
# ZSH_THEME="bira"
# ZSH_THEME="af-magic"
# ZSH_THEME="avit"
# ZSH_THEME="dracula"
# ZSH_THEME="refined"
# ZSH_THEME="agnoster"
# ZSH_THEME="fino"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

export NVM_LAZY_LOAD=true

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(
	git
	docker-compose
	tmux
  zsh-nvm
	zsh-syntax-highlighting
	zsh-autosuggestions
  pyenv
)

ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

alias b='echo -e "enter brightness:\n"; read val; xrandr  --output eDP-1 --brightness "${val}"'
alias c="clear"
alias cwd="cd ~/go/src/bitbucket.org/pick-up"
alias gbd="git checkout develop && git checkout -b"
alias gbc='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -D'
pml() {
  local re=$(printf "|%s" "$@")
  local re="/(${re:1})/"
  command pm2 logs $re
}

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
export GOPRIVATE="bitbucket.org/pick-up"
export PATH=$PATH:/usr/local/go/bin
export DEPLOY_KEY=$(cat ~/.ssh/id_rsa.base)
export POSTGRES_USER='pickup'

#export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Chrome PATH
export CHROME_EXECUTABLE=/bin/google-chrome-stable
export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$PATH:/var/lib/snapd/snap/bin/flutter"
export ADB=$HOME/Android/Sdk/platform-tools/adb scrcpy

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %aloads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/limkaleb/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/limkaleb/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/limkaleb/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/limkaleb/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zprof # bottom of .zshrc
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.poetry/bin:$PATH"
