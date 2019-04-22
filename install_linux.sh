# Install [powerline-shell](https://github.com/powerline/powerline)
pip3 install --user powerline-status


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

# Install OneDrive client
sudo apt install libffi-dev python3-dev libssl-dev inotify-tools python3-dbus
pip3 install --user git+https://github.com/xybu/onedrived-dev.git

sudo apt install -y rustc cargo

# Install go-lang (ubuntu has oooold version)
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update && sudo apt install -y golang-go go-dep

# Install newest compilers
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo add-apt-repository -s -y 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main'
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt update -y
sudo apt install -y --install-recommends gcc-8-multilib g++-8-multilib
sudo apt install -y libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime clang-9 clang-tools-9 clang-9-doc libclang-common-9-dev libclang-9-dev libclang1-9 clang-format-9 python-clang-9 libfuzzer-9-dev lldb-9 lld-9 libc++-9-dev libc++abi-9-dev libomp-9-dev

sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-9 60
sudo update-alternatives --config clang
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-9 60
sudo update-alternatives --config clang++



# Install Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add 
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
sudo apt update
sudo apt install -y brave-browser brave-keyring

sudo apt install aria2 axel pv

# Install RDP client
sudo apt install remmina -y
