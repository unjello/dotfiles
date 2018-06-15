sudo easy_install pip
pip install --user neovim
# Install [powerline-shell](https://github.com/powerline/powerline)
pip install --user powerline-status

# Install Fira Code
brew tap caskroom/fonts
brew cask install font-fira-code font-fira-mono font-fira-mono-for-powerline

# Install conan and remote repositories
brew install conan
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conan remote add unjello https://api.bintray.com/conan/unjello/public 