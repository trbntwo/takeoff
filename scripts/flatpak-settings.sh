#!/usr/bin/bash

purge-fedora-flatpak-remote(){
    sudo flatpak remote-delete --system --force fedora
}

flathub(){
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

flatpak-auto-update(){
    sudo cp ./systemd-units/flatpak-auto-update.* /etc/systemd/system/
    sudo chown root:root /etc/systemd/system/flatpak-auto-update.*
    sudo systemctl enable --now flatpak-auto-update.timer
}
