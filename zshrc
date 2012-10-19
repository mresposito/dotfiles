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
plugins=(git history-substring-search osx ssh-agent svn vi-mode lol macports autojump compleat zsh-syntax-highlighting zsh-history-substring-search zsh-output-highlighting)

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
alias l="ls -lh "
alias s='ls'
alias t='python ~/tasks/t.py --task-dir ~/tasks --list tasks'

alias ws='ssh micheler@core1.servqc.net -p 1337 '

alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'
alias -g W='| wc -l'
alias -g WC='| wc'
alias mutt='cd ~/Desktop && mutt'
source ~/flutter/code/utils/buildenv.sh
source $ZSH/oh-my-zsh.sh

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi
# autojump!
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh


# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/mysql/bin:/Users/michelericcardoesposito/.rvm/gems/ruby-1.9.2-p290@michele/bin:/Users/michelericcardoesposito/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/michelericcardoesposito/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/michelericcardoesposito/.rvm/bin
