##
# some of my defined aliases.
##

alias ldd="otool -L  "
alias h="history | grep "
alias make='make -j8'
alias scp='scp -C'

## ssh aliases
alias ssh='ssh -Y'
alias ews='ssh esposit5@remlnx.ews.illinois.edu'

## sorting aliases
alias l="ls -lh "
alias s='ls -GFh'

alias ws='ssh micheler@core1.servqc.net -p 1337 '

alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'
alias -g W='| wc -l'
alias -g WC='| wc'

alias -g du='du -h'
alias -g df='df -h'
alias -g grep='grep --color=auto'

# get fast dictionary functions in spanish
alias -g da='python /Users/mre/myDict/dict.py -a'
alias -g ds='python /Users/mre/myDict/dict.py -s'
alias -g dv='python /Users/mre/myDict/dict.py -v o'
alias -g dr='python /Users/mre/myDict/dict.py -r o'
alias -g ddd='python /Users/mre/myDict/dict.py -d'

# more git aliases
alias gs='git status '
alias grma='git ls-files --deleted -z | xargs -0 git rm'
alias gsa='git submodule add '
alias gsua='git submodule foreach git pull origin master'
