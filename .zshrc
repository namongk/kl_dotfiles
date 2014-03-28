setopt appendhistory autocd beep extendedglob nomatch notify

if [ -d $HOME/.oh-my-zsh ] ; then
    ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="minimal"
    DISABLE_AUTO_UPDATE="true"
    DISABLE_AUTO_TITLE="true"
    plugins=(git brew python vi-mode zsh-syntax-highlighting zsh-history-substring-search)
    source $ZSH/oh-my-zsh.sh

    [ -s $HOME/.prompt ] && source $HOME/.prompt
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/node_modules/.bin:/Users/kennethlove/.oh-my-zsh:/usr/local/opt/ruby/bin:$PATH"
export TERM="xterm-256color"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python3.3/site-packages:$PYTHONPATH"

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

alias bower="noglob bower"

# alias `hub` as `git`
eval "$(hub alias -s)"

export EDITOR="vim"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export DISABLE_AUTO_TITLE=true

export ARCH_FLAGS="-arch i386 -arch x86_64"

export GPGKEY=5362EDD5

export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH

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

source /usr/local/opt/autoenv/activate.sh
source /usr/local/share/zsh/site-functions
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
