# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install vim, tmux and python
brew install macvim
brew install tmux
brew cask install anaconda
brew install coreutils
brew install reattach-to-user-namespace
brew install autojump
brew install highlight
brew install zsh-syntax-highlighting 

# Link dot-files
ln -s ~/Documents/Configurations/dot-files/zshrc .zshrc
ln -s ~/Documents/Configurations/dot-files/tmux.conf .tmux.conf
ln -s ~/Documents/Configurations/dot-files/vimrc .vimrc
ln -s ~/Documents/Configurations/dot-files/vim .vim
ln -s ~/Documents/Configurations/dot-files/dir_colors .dir_colors

# Install powerline
pip install powerline-status
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
