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

# Install ffmpeg w/ NVENC for OBS
curl -L https://developer.nvidia.com/video-sdk-601 -o /tmp/video-sdk-601 && \
	pushd /tmp && \
	unzip video-sdk-601 && \
	sudo cp nvidia_video_sdk_6.0.1/Samples/common/inc/*.h /usr/local/include && \
	rm -rf video-sdk-601 && \
	popd

# TODO: sed /etc/apt/sources.list to uncomment #deb-src
sudo apt update && \
	sudo apt build-dep ffmpeg -y && \
	sudo apt install libfdk-aac-dev -y && \
	pushd /tmp && \
	apt source ffmpeg && \
	pushd ffmpeg-2.8.15 && \ #TODO: detect ffmpeg version
	./configure --prefix=/usr --extra-version=0ubuntu0.16.04.1 --build-suffix=-ffmpeg --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --cc=cc --cxx=g++ --enable-gpl --enable-shared --disable-stripping --disable-decoder=libopenjpeg --disable-decoder=libschroedinger --enable-avresample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libmodplug --enable-libmp3lame --enable-libopenjpeg --enable-libopus --enable-libpulse --enable-librtmp --enable-libschroedinger --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxvid --enable-libzvbi --enable-openal --enable-opengl --enable-x11grab --enable-libdc1394 --enable-libiec61883 --enable-libzmq --enable-frei0r --enable-libx264 --enable-libopencv --enable-nonfree --enable-nvenc --enable-libfdk-aac && \
	make -j 8 && \
	sudo make install && \
	popd && rm -rf ffmpeg-2.8.15 && popd

# Install OBS
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update -qq -y
sudo apt install obs-studio -y

# Install Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add 
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
sudo apt update
sudo apt install -y brave-browser brave-keyring

sudo apt install aria2 axel pv

# Install RDP client
sudo apt install remmina -y
