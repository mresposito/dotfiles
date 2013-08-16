# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
MYZSH=$HOME/.zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="sunAndMoon"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# turn off auto renaming title
DISABLE_AUTO_TITLE="true"
# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump osx  svn vi-mode lol compleat brew pip sbt scala)
# plugins not in use
# ssh-agent

# turn off stupid auto correct
unsetopt correct_all 

source $ZSH/oh-my-zsh.sh
source $MYZSH/completion.zsh
source $MYZSH/aliases.zsh
source $MYZSH/functions.zsh
source $MYZSH/sunAndMoon.zsh-theme
source $MYZSH/plugins/syntaxHighlighting/zsh-syntax-highlighting.zsh
source $MYZSH/plugins/zshHistorySubstringSearch/zsh-history-substring-search.plugin.zsh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/mysql/bin:/Users/mre/.rbenv/bin:/Users/mre/.rbenv/versions/1.9.3-p327/bin/:/usr/texbin:/Users/mre/bin/play-curr:$HOME/bin:$HOME/.cabal/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

###
# vim substring search options
###
# bind arrow up
for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode
# bind vim mode keys
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
export PATH=$PATH:~/src/play/play-cur
