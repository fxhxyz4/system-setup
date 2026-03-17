#!/usr/bin/env bash

set -euo pipefail

log() {
    echo
    echo "[*] $1"
}

if ! command -v apt >/dev/null 2>&1; then
    echo "[!] This script is intended for Ubuntu/Debian-based systems."
    exit 1
fi

log "Updating package lists"
sudo apt update

log "Upgrading installed packages"
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

log "Installing git, ufw, fastfetch, openssh-server"
sudo apt install -y git ufw fastfetch openssh-server

log "Enabling SSH service"
sudo systemctl enable ssh
sudo systemctl restart ssh

log "Allowing SSH through firewall"
sudo ufw allow OpenSSH

log "Enabling UFW"
sudo ufw --force enable

log "Final status"
echo "SSH:"
sudo systemctl is-active ssh || true

echo
echo "UFW:"
sudo ufw status

echo
echo "Git:"
git --version || true

echo
echo "Fastfetch:"
fastfetch || true

echo
echo "[+] Server setup completed."
