# Install Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
# http://robots.thoughtbot.com/post/19398560514/how-to-copy-and-paste-with-tmux-on-mac-os-x
# fix tmux copy and paste
brew install reattach-to-user-namespace
installDir= ~/install # fixmee!
if [ ! -d "$installDir" ]; then
  mkdir $installDir
fi 
cd $installDir
git clone https://github.com/clvv/fasd.git
cd fasd
make install
