#!/usr/bin/env bash

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