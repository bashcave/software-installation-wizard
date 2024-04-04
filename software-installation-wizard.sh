#!/bin/bash

# Software Installation Wizard
# Guides the user through installing necessary software packages, supporting multiple package managers.
#
# @author BASHCAVE
# @version 1.0.0
# @license MIT

echo "Welcome to the Software Installation Wizard"

# Determine Package Manager
if command -v apt-get >/dev/null; then
    pkg_manager="apt-get"
    update_cmd="sudo apt-get update"
    install_cmd="sudo apt-get install -y"
elif command -v yum >/dev/null; then
    pkg_manager="yum"
    update_cmd="sudo yum check-update"
    install_cmd="sudo yum install -y"
elif command -v zypper >/dev/null; then
    pkg_manager="zypper"
    update_cmd="sudo zypper refresh"
    install_cmd="sudo zypper install -y"
else
    echo "Unsupported package manager. This script supports apt-get, yum, and zypper."
    exit 1
fi

# List of software packages to check and potentially install
declare -a software_list=("curl" "vim" "git" "htop")

update_system() {
    echo "Updating package lists using $pkg_manager..."
    $update_cmd
}

install_software() {
    for software in "${software_list[@]}"; do
        echo "Do you want to install $software? (y/n)"
        read answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            if command -v $software >/dev/null; then
                echo "$software is already installed."
            else
                echo "Installing $software..."
                $install_cmd "$software"
                if [ $? -ne 0 ]; then
                    echo "Installation of $software failed. Please check your package manager and internet connection."
                    exit 1
                fi
            fi
        else
            echo "Skipping $software."
        fi
    done
}

# Main
update_system
install_software
echo "Software installation process completed."
