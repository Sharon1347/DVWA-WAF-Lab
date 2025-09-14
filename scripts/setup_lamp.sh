#!/usr/bin/env bash
set -euo pipefail

# Beginner-friendly LAMP installer for Ubuntu Server
# Read the script before running. Run as a user with sudo privileges.

echo "Updating package list..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing Apache, PHP, MySQL..."
sudo apt-get install -y apache2 php php-mysql mysql-server git curl

# Enable Apache rewrite module (DVWA sometimes uses it)
sudo a2enmod rewrite || true

# Make Apache listen on 8080 by copying example conf (user must still enable/modify sites if needed)
if [ -f "$(pwd)/configs/apache_ports.conf" ]; then
  sudo cp "$(pwd)/configs/apache_ports.conf" /etc/apache2/ports.conf
else
  echo "configs/apache_ports.conf not found in current directory. Please copy it manually if needed."
fi

echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Securing MySQL (interactive). You will be prompted to set a root password and make choices."
sudo mysql_secure_installation || echo "mysql_secure_installation may require interactive input. If it fails non-interactively, run it manually."

echo "LAMP installation finished."
