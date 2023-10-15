#!/usr/bin/env bash
set -ex

LINUXQQ_VERSION=$1

# Install Discord from deb
apt-get update
curl -L -o linuxqq.deb  "https://dldir1.qq.com/qqfile/qq/QQNT/d3b9a722/linuxqq_3.2.0-16736_arm64.deb"
apt-get install -y ./linuxqq.deb
rm linuxqq.deb

# Default config values
# mkdir -p $HOME/.config/QQ

# Desktop file setup
cp /usr/share/applications/qq.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/qq.desktop
chmod +x /opt/QQ/qq

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
    apt-get autoclean
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
fi
