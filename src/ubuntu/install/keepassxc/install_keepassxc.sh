#!/usr/bin/env bash
set -ex

# Add Langpacks
add-apt-repository ppa:phoerious/keepassxc

# Install Keepassxc from deb
apt-get update
apt-get install -y keepassxc

# Clean apt
rm -rf $HOME/.launchpadlib



# Desktop file setup
cp /usr/share/applications/org.keepassxc.KeePassXC.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/org.keepassxc.KeePassXC.desktop
chmod +x /usr/bin/keepassxc

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
    apt-get autoclean
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
fi
