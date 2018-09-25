# Install pip and pip3
sudo apt install python3-pip python3-dev -y

# Install neovim
sudo apt install software-properties-common build-essential cmake -y
sudo apt-add-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install neovim -y
pip3 install --user neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Install [powerline-shell](https://github.com/powerline/powerline)
pip3 install --user powerline-status

# Install git prompt helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

# Install kitty terminal (needs latest freetype engine)
sudo add-apt-repository ppa:glasen/freetype2 -y
sudo apt-get update
sudo apt-get install freetype6 -y
url -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

# Install exa
mkdir -p ~/.tmp
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip -O ~/.tmp/exa-linux.zip && \
	cd ~/.tmp && \
	unzip exa-linux.zip && \
	sudo cp exa-linux-x86_64 /usr/local/bin/exa && \
	rm -rf ~/.tmp

# Install Fira-Code font
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d ${fonts_dir} ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p ${fonts_dir}
else
    echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e ${file_path} ]; then
        echo "wget -O $file_path $file_url"
        wget -O ${file_path} ${file_url}
    else
	echo "Found existing file $file_path"
    fi;
done

echo "fc-cache -f"
fc-cache -f

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install 10
nvm use 10
npm i -g npm
npm i -g pnpm
npm i -g pm2

# Install KeepassXC
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo apt update
sudo apt install keepassxc -y

# Install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
sudo dpkg -i ripgrep_0.9.0_amd64.deb
rm ripgrep_0.9.0_amd64.deb

# Install OneDrive client
sudo apt install libffi-dev python3-dev libssl-dev inotify-tools python3-dbus
pip3 install --user git+https://github.com/xybu/onedrived-dev.git

sudo apt install rustc cargo golang

# for glxinfo
sudo apt install mesa_utils

sudo apt install mc tmux

# Install newest compilers
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo add-apt-repository -s -y 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main'
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt update -y
sudo apt install -y --install-recommends gcc-8-multilib g++-8-multilib
sudo apt install -y libllvm8 llvm-8 llvm-8-dev llvm-8-doc llvm-8-examples llvm-8-runtime clang-8 clang-tools-8 clang-8-doc libclang-common-8-dev libclang-8-dev libclang1-8 clang-format-8 python-clang-8 libfuzzer-8-dev lldb-8 lld-8 libc++-8-dev libc++abi-8-dev libomp-8-dev

# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $(whoami)
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chown root:docker /usr/local/bin/docker-compose
sudo chmod ug+x /usr/local/bin/docker-compose
