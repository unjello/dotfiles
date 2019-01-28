sudo yum group mark install "Development Tools"
sudo yum group update "Development Tools"

# Inline with Upstream Stable
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm

# install pip
sudo yum install -y python27-python-pip

# Install pip3
sudo yum install -y python36u python36u-pip python36u-devel

# Install Visual Studio Code per
# https://code.visualstudio.com/docs/setup/linux
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo yum check-update
sudo yum -y install code

# Install vscode extensions
code --install-extension sdras.night-owl
code --install-extension vscoss.vscode-ansible
code --install-extension robertohuertasm.vscode-icons
code --install-extension rust-lang.rust
code --install-extension samuelcolvin.jinjahtml

# Install git helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

# Install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
tar -zxf ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-0.10.0-x86_64-unknown-linux-musl/rg /usr/local/bin
rm -rf ripgrep-0.10.0-x86_64-unknown-linux-musl*

# Install exa
sudo yum install -y libgit2-devel cmake
sudo chown `whoami`: -R /usr/local
git clone https://github.com/ogham/exa.git
pushd exa; make install; popd
rm -rf exa

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
fc-cache -f
