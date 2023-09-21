#!/usr/bin/bash

for OPTION in $@; do
    case $OPTION in
        -s | --settings)
            source ./scripts/settings.sh
            date-time
            windows
            file-history
            sound
            power
            mouse-touchpad
            nautilus
            ;;
        --10s-shutdown)
            source ./scripts/settings.sh
            10s-shutdown
            ;;
        --fix-suspend)
            source ./scripts/settings.sh
            fix-suspend
            ;;
        -d | --dnf-config)
            source ./scripts/dnf.sh
            dnf-config
            ;;
        -v | --virtualization)
            source ./scripts/virtualization.sh
            virtualization
            ;;
        -p | --podman)
            source ./scripts/virtualization.sh
            podman
            ;;
        --podman-docker)
            source ./scripts/virtualization.sh
            podman-docker
            ;;
        --docker)
            source ./scripts/virtualization.sh
            docker
            ;;
        --distrobox)
            source ./scripts/virtualization.sh
            distrobox
            ;;
        --install-packages)
            source ./scripts/packages.sh
            install-packages
            ;;
        --remove-packages)
            source ./scripts/packages.sh
            remove-packages
            ;;
        -r | --rpmfusion)
            source ./scripts/rpmfusion.sh
            rpmfusion
            ;;
        --v4l2loopback)
            source ./scripts/rpmfusion.sh
            v4l2loopback
            ;;
        -m | --multimedia)
            source ./scripts/rpmfusion.sh
            multimedia
            ;;
        --purge-fedora-flatpak-remote)
            source ./scripts/flatpak-settings.sh
            purge-fedora-flatpak-remote
            ;;
        --enable-flathub)
            source ./scripts/flatpak-settings.sh
            flathub
            ;;
        --install-flatpaks)
            source ./scripts/packages.sh
            install-flatpaks
            ;;
        --remove-flatpaks)
            source ./scripts/packages.sh
            remove-flatpaks
            ;;
        --flatpak-auto-update)
            source ./scripts/flatpak-settings.sh
            flatpak-auto-update
            ;;
        --tutanota)
            source ./scripts/packages.sh
            tutanota
            ;;
        -t | --themes)
            source ./scripts/themes.sh
            themes
            ;;
        --firefox-gnome)
            source ./scripts/themes.sh
            firefox-gnome
            ;;
        -c | --clean)
            source ./scripts/clean.sh
            clean
            ;;
        -* | --*
            echo "$OPTION | isn't a valid option"
    esac
done
