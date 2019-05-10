#!/usr/bin/evn bash
sudo apt install -y openjdk-11-jdk

curl -LO https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
curl -LO https://download.clojure.org/install/linux-install-1.10.0.442.sh
bash linux-install-1.10.0.442.sh
