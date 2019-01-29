# Path to your oh-my-zsh installation.
export ZSH=/Users/yufanlu/.oh-my-zsh
export MONO_GAC_PREFIX="/usr/local"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home"
export PYENV_ROOT="$HOME/.pyenv"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jbergantine" # "af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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
plugins=(git brew tmux python iterm2)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:$HOME/.cargo/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$QHOME:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# tmux
# export TERM=xterm-256color

# itermplot
#export MPLBACKEND="module://itermplot"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# kdb
export QHOME="~/q"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"

alias doc="cd ~/Documents"
alias dot="cd ~/dotfiles"
alias wp="~/dotfiles/workspace"

# hexo
alias hd="hexo clean; hexo g; hexo deploy"
alias hs="hexo clean; hexo g; hexo s"
alias buc="brew update; brew upgrade; brew cleanup"

# files and folders
alias q='QHOME=~/q rlwrap -r ~/q/m32/q'
alias vzj='vim -u ~/dotfiles/vimrc_vzj'
alias nvzj='nvim -u ~/dotfiles/nvimrc_vzj'


# OPAM configuration
. /Users/yufanlu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv
eval "$(pyenv init -)"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
