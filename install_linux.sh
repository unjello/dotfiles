sudo easy_install pip
pip3 install --user neovim

# Install [powerline-shell](https://github.com/powerline/powerline)
pip install --user powerline-status

# Install git prompt helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

# Install exa
mkdir -p ~/.tmp
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip -O ~/.tmp/exa-linux.zip && \
	cd ~/.tmp && \
	unzip exa-linux.zip && \
	sudo cp exa-linux-x86_64 /usr/local/bin && \
	rm -rf ~/.tmp
