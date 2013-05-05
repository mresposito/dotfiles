# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunAndMoon"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump history-substring-search osx  svn vi-mode lol macports compleat zsh-syntax-highlighting zsh-history-substring-search zsh-output-highlighting)
# plugins not in use
# ssh-agent

# turn off stupid auto correct
unsetopt correct_all 

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space

alias ldd="otool -L  "
alias h="history | grep "
alias make='make -j8'
alias scp='scp -C'
alias ssh='ssh -Y'

alias wi="ssh whistler"
alias ta="ssh tahoe "
alias tools="ssh tools "
alias magic="ssh magic "
alias analytics="ssh analytics "
alias ews='ssh esposit5@remlnx.ews.illinois.edu'
alias l="ls -lh "
alias s='ls'

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
alias grma='git ls-files --deleted -z | xargs -0 git rm'

source $ZSH/oh-my-zsh.sh

exip () {
    # gather external ip address
        echo -n "Current External IP: "
        curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh ]]

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/mysql/bin:/Users/mre/.rbenv/bin:/Users/mre/.rbenv/versions/1.9.3-p327/bin/:/usr/texbin:/Users/mre/bin/play-2.0.4:/Users/mre/bin
# send to ews
ewsend()
{ python $ZSH/plugins/send.py $* }

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
