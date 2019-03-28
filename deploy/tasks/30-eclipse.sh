#!/usr/bin/env bash

eclipse_url="http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-jee-2019-03-R-linux-gtk-x86_64.tar.gz"
eclipse_sha="a85d59edce742482decb86002a4007d0f073cc11533de616960a77ff8dc1add8631ed24a1a6d5dc1c8246e1597cf39101fa79048bd93051216fd23c2001001d9"
eclipse_tmp="eclipse-jee.tar.gz"

eclim_url="https://github.com/ervandew/eclim/releases/download/2.8.0/eclim_2.8.0.bin"
eclim_tmp="eclim.bin"

if [[ ! -d /opt/eclipse ]]; then
  mkdir -p ~/temp_deploy
  echo "Downloading Eclipse..."
  pushd ~/temp_deploy >/dev/null && curl -#SL $eclipse_url -o $eclipse_tmp && echo "$eclipse_sha *$eclipse_tmp" | sha512sum -c -
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading Eclipse. Skipping ..."
  else
    sudo tar -zxf $eclipse_tmp -C /opt
    sudo chown `whoami`: -R /opt/eclipse
    if [[ ! -f /usr/local/bin/eclipse ]]; then
      sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
    fi

    if [[ ! -f /usr/share/applications/eclipse.desktop ]]; then
      sudo bash -c 'cat > /usr/share/applications/eclipse.desktop <<EOF
[Desktop Entry]
Name=Eclipse IDE
Comment=Eclipse IDE
Type=Application
Encoding=UTF-8
Exec=/usr/local/bin/eclipse
Icon=/opt/eclipse/icon.xpm
Categories=GNOME;Application;Development;
Terminal=false
StartupNotify=true
EOF'
    fi
    echo "Eclipse successfully installed."
  fi
  popd >/dev/null && rm -rf ~/temp_deploy
else
    echo "Eclipse is already installed"
fi

if [[ ! -f /opt/eclipse/eclimd ]]; then
  mkdir -p ~/temp_deploy
  echo "Downloading Eclim..."
  pushd ~/temp_deploy >/dev/null && curl -#SL $eclim_url -o $eclim_tmp
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading Eclipse. Skipping ..."
  else
    sh $eclim_tmp --eclipse=/opt/eclipse --plugins=jdt --vimfiles=skip --yes
    ln -s $(dirname $(readlink -f /opt/eclipse/eclimd))/eclim /opt/eclipse/eclim
    # workspace directory will be required by tools using eclim
    mkdir -p ~/.workspace
    echo "Eclim successfully installed."
  fi
  popd >/dev/null && rm -rf ~/temp_deploy
else
  echo "Eclim is already installed"
fi
