#!/usr/bin/env bash
[[ -z "$CORE_INCLUDED" ]] && { echo "Do not run directly. Use deploy.sh or run.sh"; exit 1; }

java_url="https://download.java.net/java/GA/jdk12/GPL/openjdk-12_linux-x64_bin.tar.gz"
java_sha="b43bc15f4934f6d321170419f2c24451486bc848a2179af5e49d10721438dd56"
java_tmp="java.tar.gz"

if [[ ! -d /opt/java/jdk-12 ]]; then
  mkdir -p ~/temp_deploy
  echo "Downloading JDK-12..."
  pushd ~/temp_deploy >/dev/null && curl -#SL $java_url -o $java_tmp && echo "$java_sha *$java_tmp" | sha256sum -c -
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading JDK-12. Skipping ..."
  else
    if [[ ! -d /opt/java ]]; then
      sudo mkdir -p /opt/java
      sudo chown `whoami`: -R /opt/java
    fi
    tar -zxf $java_tmp -C /opt/java
    echo "JDK-12 successfully installed."
  fi
  popd >/dev/null && rm -rf ~/temp_deploy
else
    echo "JDK-12 is already installed"
fi