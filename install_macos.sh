sudo easy_install pip
brew install python3
pip3 install --user neovim
# Install [powerline-shell](https://github.com/powerline/powerline)
pip install --user powerline-status

# Install Fira Code
brew tap caskroom/fonts
brew cask install font-fira-code font-fira-mono font-fira-mono-for-powerline

# Install conan and remote repositories
brew install conan
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
conan remote add unjello https://api.bintray.com/conan/unjello/public 

# Install git prompt helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

# Install exa
brew install exa

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bas
nvm install 9
nvm use 9
npm i -g npm
npm i -g pnpm
npm i -g pm2
