#!/usr/bin/bash

rpmfusion(){
    sudo dnf install -y \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf groupupdate -y core
}

v4l2loopback(){
    if [[ ! -f "/etc/yum.repos.d/rpmfusion-free.repo" && ! -f "/etc/yum.repos.d/rpmfusion-nonfree.repo" ]]; then
        echo "rpmfusion is not installed"
        echo "rpmfusion is required for v4l2loopback"
        echo "adding rpmfusion repo now"
        rpmfusion
    fi
    sudo dnf install -y \
        v4l2loopback \
        kmod-v4l2loopback
}

multimedia(){
    if [[ ! -f "/etc/yum.repos.d/rpmfusion-free.repo" && ! -f "/etc/yum.repos.d/rpmfusion-nonfree.repo" ]]; then
        echo "rpmfusion is not installed"
        echo "rpmfusion is required for additional multimedia codecs"
        echo "adding rpmfusion repo now"
        rpmfusion
    fi
    sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
    sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
    sudo dnf groupupdate -y sound-and-video
}