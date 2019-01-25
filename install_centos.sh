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

# Install git helpers
mkdir -p ~/bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/bin/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/bin/.git-prompt.bash

