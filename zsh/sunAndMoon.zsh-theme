
# borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '♃' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    export TIME=`date "+%H%M"`
    if [[ $TIME -lt 1600 && $TIME -gt 1000 ]]; then
    echo '☀' && return
    elif [[ ($TIME -lt 1900 && $TIME -gt 1559) || ( $TIME -lt 0959 && $TIME -gt 0800 )]]; then
    echo '☼' && return
    fi
    echo '☾' && return
}

function battery_charge {
    echo ` $python ~/.zsh/plugins/batterystats.py` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`')'
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}%{${fg[green]}%}%3~%{$reset_color%}$(git_prompt_info)$(virtualenv_info) $(prompt_char)%{$reset_color%} '
RPROMPT='${return_code} %{$fg[white]%}%*$(battery_charge)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
