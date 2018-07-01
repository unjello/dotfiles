sudo easy_install pip
pip install --user neovim

# Install [powerline-shell](https://github.com/powerline/powerline)
pip install --user powerline-status

# Install git prompt helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash
