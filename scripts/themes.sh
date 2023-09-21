#!/usr/bin/bash

themes(){
    # adw-gtk3
    sudo dnf install -y adw-gtk3-theme
    # MoreWaita
    sudo dnf copr enable -y dusansimic/themes
    sudo dnf install -y morewaita-icon-theme
    # Capitaine-cursors
    sudo dnf install -y la-capitaine-cursor-theme
    #########################################################################
    # GNOME-theme
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    # adw-gtk3
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
    # MoreWaita
    gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
    # Capitaine-cursors
    gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'
}

firefox-gnome(){
    # download
    git clone https://github.com/rafaelmardojai/firefox-gnome-theme
    cd firefox-gnome-theme
    # get right version and checkout branch
    git checkout v$(firefox --version | cut -d ' ' -f 3 | cut -d '.' -f 1)
    # installation
    sh ./scripts/auto-install.sh
    cd ..
}