#!/usr/bin/bash

install-packages(){
    # install specified packages
    sudo dnf install -y $(cat ./packages/install-packages.txt)
}

remove-packages(){
    # remove specified packages
    sudo dnf remove -y $(cat ./packages/remove-packages.txt)
}

install-flatpaks(){
    # install specified flatpaks
    FLATPAKS=$(cat ./packages/install-flatpaks.txt)
    for FLATPAK in $FLATPAKS; do
        flatpak install -y --noninteractive flathub $FLATPAK
    done
}

remove-flatpaks(){
    # remove specified flatpaks
    FLATPAKS=$(cat ./packages/remove-flatpaks.txt)
    for FLATPAK in $FLATPAKS; do
        flatpak remove -y --noninteractive $FLATPAK
    done
}

tutanota(){
    # install tutanota appimage
    mkdir -p ~/.local/share/appimages
    curl -s -O https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage
    chmod ug+x tutanota-desktop-linux.AppImage
    mv tutanota-desktop-linux.AppImage ~/.local/share/appimages
}
