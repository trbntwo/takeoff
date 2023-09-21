#!/usr/bin/bash

clean(){
    sudo dnf autoremove -y
    flatpak remove -y --noninteractive --unused
}