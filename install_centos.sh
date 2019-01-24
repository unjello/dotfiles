sudo yum group mark install "Development Tools"
sudo yum group update "Development Tools"

# Inline with Upstream Stable
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm

# install pip
sudo yum install -y python27-python-pip

# Install pip3
sudo yum install -y python36u python36u-pip python36u-devel
