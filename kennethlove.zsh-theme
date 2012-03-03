# Powerline symbols: ⮂ ⮃ ⮀ ⮁ ⭤

function hg_prompt_info {
    hg prompt --angle-brackets "\
< %{$reset_color%}on %{$fg[yellow]%}<branch>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}" 2>/dev/null
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[black]$bg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} ⮀%{$fg[black]$bg[blue]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN=" "

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$reset_color%}%{$fg[black]$bg[white]%} %c %{$fg[white]$bg[blue]%}⮀\
%{$fg[black]$bg[blue]%} $(git_prompt_info)$(hg_prompt_info)%{$reset_color%}%{$fg[blue]%}⮀%{$reset_color%} '

PROMPT2='%{$fg[black]$bg[white]%} %{$reset_color%}%{$fg[white]%}⮀%{$reset_color%} '

RPS1='%{$reset_color%}%{$fg[black]%}⮂%{$fg[white]$bg[black]%} %t %{$reset_color%}'
