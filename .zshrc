# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="../custom/themes/kennethlove"
# ZSH_THEME="kolo"
ZSH_THEME="minimal"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew python vi-mode zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/share/node_modules/.bin:/Users/kennethlove/.oh-my-zsh:/usr/local/Cellar/ruby/1.9.3-p327/bin:/usr/local/Cellar/ruby/1.9.3-p125/bin:$PATH"
export TERM="xterm-256color"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# Stop Python from generating .pyc files
# export PYTHONDONTWRITEBYTECODE=1

# eval `gdircolors /Users/kennethlove/kl_dotfiles/dircolors.256dark`
export CLICOLOR=1

alias ls="ls -aFGhkLlpsTP"
alias l="ls"
alias top="top -ocpu"
alias c="clear"

alias pm="python manage.py"
alias sm="python manage.py schemamigration"
alias m="python manage.py migrate"
alias pmr="python manage.py runserver"
alias pms="python manage.py shell"
alias pmrp="python manage.py runserver_plus"
alias pmsp="python manage.py shell_plus"
alias pmcs="python manage.py collectstatic --noinput"

alias brack3t="pelican . -o . -s settings.py"

# alias `hub` as `git`
eval "$(hub alias -s)"

export EDITOR="vim"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/share/python/virtualenvwrapper.sh
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

export ARCH_FLAGS="-arch i386 -arch x86_64"

any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
