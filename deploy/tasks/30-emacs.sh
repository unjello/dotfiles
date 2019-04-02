#!/usr/bin/env bash

[[ $(declare -f getOsFamily) ]] && . 00-detect-os.sh
echo $1
GLOBAL=$(getOsFamily)
echo "$GLOBAL"
if [[ $GLOBAL -eq "redhat" ]]; then
  sudo yum -y install ncurses-devel libXpm-devel libjpeg-turbo-devel openjpeg-devel openjpeg2-devel turbojpeg-devel giflib-devel libtiff-devel gnutls-devel libxml2-devel GConf2-devel dbus-devel wxGTK-devel gtk3-devel
fi

#if [[ ! -f /usr/bin/emacs ]]; then
#  mkdir -p ~/temp_deploy
#  echo "Installing Emacs"
#  pushd ~/temp_deploy >/dev/null && curl -#SL https://github.com/emacs-mirror/emacs/archive/emacs-26.1.92.tar.gz | tar -zxf - --strip-components=1
#  if [[ $? -ge 1 ]]; then
#    echo "There was a problem with downloading Emacs. Skipping ..."
#  else
#    sh autogen.sh
#    ./configure --without-makeinfo --with-mailutils
#    make -j 4
#    sudo make install
#  fi
#  popd >/dev/null && rm -rf ~/temp_deploy
#else
#  echo "Emacs already installed."
#fi