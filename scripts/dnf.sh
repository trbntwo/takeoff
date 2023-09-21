#!/usr/bin/bash

dnf-config(){
    echo "max_parallel_downloads=6" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
    echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
}
