# If you come from bash you might have to change your $PATH.
#
ZSH_DISABLE_COMPFIX=true
export PATH=$HOME/bin:$PATH
export VISUAL="nvim"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#wal colors
#cat /home/kassio/.cache/wal/sequences

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="arrow"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#chromium ext
export CHROMIUM_FLAGS='--enable-remote-extensions'
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#General
alias minidlna="minidlnad -d -f /home/$USER/.config/minidlna/minidlna.conf -P /home/$USER/.config/minidlna/minidlna.pid"
alias mediaserver="minidlna"
alias sf="neofetch"
alias irssi="screen irssi"
alias cal="cal -j"
alias py="python3"
alias mpd="mpd && mpDris2 >> /dev/null &"
# programming
crun(){
	cc "$1" -o out && ./out
}
alias makerun="make && ./out"
glrun(){
    g++ "$1" -lGL -lSOIL -lGLU -lglut -o out && ./out
}
#vim 
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias vo="nvim -c CtrlP"
alias vw="nvim -c VimwikiIndex"
alias vp="nvim ~/.senttemplate"
alias present="sent"
#Package management
alias pac="brew install"
alias pacs="brew search"
alias pacr="brew remove"
#Git
alias gitcl="git clone"
alias gitps="git push"
alias gitpl="git pull"
alias gita="git add "
alias gitrm="git rm"
alias gitco="git commit -m"
alias gits="git status"
alias gitck="git checkout"
alias gitbr="git branch"
alias gitd="git diff"
#docker
alias doclist="docker.sh"
alias docrn="docker stats --format {{.Name}} --no-stream > ~/.container-list && echo 'container list updated'"
alias docup="docker-compose up -d && docrn"
alias docdown="docker-compose down && docrn"
alias docstats="docker stats"
