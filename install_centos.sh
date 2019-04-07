# Install git helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

# Install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
tar -zxf ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-0.10.0-x86_64-unknown-linux-musl/rg /usr/local/bin
rm -rf ripgrep-0.10.0-x86_64-unknown-linux-musl*

# Install both Cmake 2.x and 3.x
sudo yum install -y cmake cmake3
sudo alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10 \
--slave /usr/local/bin/ctest ctest /usr/bin/ctest \
--slave /usr/local/bin/cpack cpack /usr/bin/cpack \
--slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake \
--family cmake
sudo alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20 \
--slave /usr/local/bin/ctest ctest /usr/bin/ctest3 \
--slave /usr/local/bin/cpack cpack /usr/bin/cpack3 \
--slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake3 \
--family cmake

# Install exa
sudo yum install -y libgit2-devel
sudo chown `whoami`: -R /usr/local
git clone https://github.com/ogham/exa.git
pushd exa; make install; popd
rm -rf exa

# Install socat for ssh tunelling
sudo yum install -y socat

# Install emacs
sudo yum install -y emacs

# Install nvm
mkdir -p ~/.nvm
export LD_LIBRARY_PATH=/opt/rh/httpd24/root/usr/lib64:$LD_LIBRARY_PATH
sudo ldconfig
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install 11
