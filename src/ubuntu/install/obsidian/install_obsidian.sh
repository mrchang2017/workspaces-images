#!/usr/bin/env bash
set -ex

OBSIDIAN_VERSION=1.4.16
ARCH=arm64

# Install Discord from deb
mkdir /app
apt-get update
curl --location --output /app/obsidian.tar.gz "https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian-${OBSIDIAN_VERSION}-${ARCH}.tar.gz"
cd /app && tar xvf obsidian.tar.gz && rm -rf obsidian.tar.gz && mv obsidian-${OBSIDIAN_VERSION}-${ARCH} obsidian
cd /app/obsidian && chmod +x obsidian && chown root:root /app/obsidian/chrome-sandbox && chmod 4755 /app/obsidian/chrome-sandbox

# Default config values

# Desktop file setup

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
    apt-get autoclean
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
fi
