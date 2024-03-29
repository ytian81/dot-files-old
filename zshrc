# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/Yang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnosterzak"
export DEFAULT_USER=`whoami`

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  tmux
  autojump
)

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="mvim -v"
alias pwd='pwd; pwd | pbcopy'
alias o='open'
alias -s txt="open"
alias -s md="open"
alias -s pdf="open"
alias -s tar="tar -xvf"
alias -s gz="tar -xzvf"
alias -s tgz="tar -xzvf"
alias -s bz2="tar -xjvf"
alias -s zip="unzip"

export TERM=xterm-256color

# Man page highlight
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Cat, less and more highlight
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force --style solarized-dark"
export LESS=" -R"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'
alias cat="$(which highlight) $1 --out-format xterm256 --line-numbers --quiet --force --style solarized-dark"
alias c='less -m -N -g -i -J --line-numbers --underline-special'

# Tmux setup
export ZSH_TMUX_AUTOSTART=true 
export ZSH_TMUX_AUTOCONNECT=false

# Autosuggestions setup
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'
bindkey '^ ' autosuggest-accept

# PATH setup
# Anaconda3, GNU CoreUtils
export SANS_ANACONDA="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Tex/texbin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# Add Anaconda3 PATH
export PATH="/usr/local/anaconda3/bin:$SANS_ANACONDA"
#
alias perseus="export PATH=\"$SANS_ANACONDA\" && echo Medusa decapitated."
alias medusa="export PATH=\"/usr/local/anaconda3/bin:$SANS_ANACONDA\" && echo Perseus defeated."
#
brew () {
  perseus
  command brew "$@"
  medusa
}

# GNU CoreUtils color 
alias ls='ls -F -h --show-control-chars --color=auto'
eval `gdircolors -b $HOME/.dir_colors`

# python virtual environment
alias deactivate='source deactivate'
# pyTorch activate
alias pyTorch='source activate pyTorch'

# the fuck correction
eval $(thefuck --alias f)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh
