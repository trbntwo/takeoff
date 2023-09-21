#!/usr/bin/bash

virtualization(){
    # install all required packages
    sudo dnf install -y \
        virt-install \
        libvirt-daemon-config-network \
        libvirt-daemon-kvm \
        qemu-kvm \
        virt-manager
    # enable and start daemon
    sudo systemctl enable --now libvirtd
    # add user to required group
    sudo usermod -aG libvirt $(whoami)
}

podman(){
    sudo dnf install -y \
        podman \
        buildah \
        skopeo
}

podman-docker(){
    sudo dnf install -y podman-docker
}

docker(){
    # install dependencies
    sudo dnf -y install dnf-plugins-core
    # add repo
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    # install required packages
    sudo dnf install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
    # enable and start daemon
    sudo systemctl enable --now docker
    # add user to required group
    sudo usermod -aG docker $(whoami)
}

distrobox(){
    sudo dnf install -y distrobox
}
