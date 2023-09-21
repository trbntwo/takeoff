#!/usr/bin/bash

date-time(){
    gsettings set org.gnome.desktop.interface clock-show-weekday true
    gsettings set org.gnome.desktop.calendar show-weekdate true
}

windows(){
    gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
    gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
    gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'
    gsettings set org.gnome.desktop.wm.preferences action-right-click-titlebar 'none'
    gsettings set org.gnome.mutter center-new-windows true
}

file-history(){
    gsettings set org.gnome.desktop.privacy remember-recent-files false
    gsettings set org.gnome.desktop.privacy remove-old-trash-files true
    gsettings set org.gnome.desktop.privacy remove-old-temp-files true
    gsettings set org.gnome.desktop.privacy old-files-age 7
}

sound(){
    gsettings set org.gnome.desktop.sound event-sounds false
}

power(){
    gsettings set org.gnome.desktop.interface show-battery-percentage true
}

mouse-touchpad(){
    gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
    gsettings set org.gnome.desktop.peripherals.touchpad click-method 'area'
    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
}

nautilus(){
    gsettings set org.gtk.Settings.FileChooser sort-directories-first true
    gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
}

10s-shutdown(){
    sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/user.conf
    sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
}

fix-suspend(){
    sudo cp ./systemd-units/fix-suspend.* /etc/systemd/system/
    sudo chown root:root /etc/systemd/system/fix-suspend.*
    sudo systemctl enable --now fix-suspend.timer
}
