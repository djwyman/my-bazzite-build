#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
# Remove the autologin to gamescope-session
rm /etc/sddm.conf.d/steamos.conf

# Remove virtual keyboard on SDDM
# as this image is for workstations and permanently docked steamdecks
rm /etc/sddm.conf.d/virtualkbd.conf

# Disable the steam session management service
systemctl disable bazzite-autologin.service

dnf install kpatience
