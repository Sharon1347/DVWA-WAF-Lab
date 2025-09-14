#!/usr/bin/env bash
set -euo pipefail

# Installs DVWA into /var/www/html/DVWA and creates DB/user
# Run on Ubuntu VM as sudo or root

DVWA_DIR="/var/www/html/DVWA"
DB_NAME="dvwa"
DB_USER="dvwa_user"
DB_PASS="p@ssw0rd"

# Install git if missing
if ! command -v git >/dev/null 2>&1; then
  echo "Installing git..."
  sudo apt-get install -y git
fi

# Clone DVWA
sudo rm -rf "$DVWA_DIR"
sudo git clone https://github.com/digininja/DVWA.git "$DVWA_DIR"

# Set permissions
sudo chown -R www-data:www-data "$DVWA_DIR"
sudo chmod -R 755 "$DVWA_DIR"

# Copy sample config
sudo cp "$DVWA_DIR/config/config.inc.php.dist" "$DVWA_DIR/config/config.inc.php" || true

# Update config values (simple sed replacements — verify file contents if this fails)
sudo sed -i "s/\$DBMS = 'MySQL';/\$DBMS = 'MySQL';/" "$DVWA_DIR/config/config.inc.php" || true
sudo sed -i "s/\$db = 'dvwa';/\$db = '$DB_NAME';/" "$DVWA_DIR/config/config.inc.php" || true
sudo sed -i "s/\$user = 'root';/\$user = '$DB_USER';/" "$DVWA_DIR/config/config.inc.php" || true
sudo sed -i "s/\$pass = 'p@ssw0rd';/\$pass = '$DB_PASS';/" "$DVWA_DIR/config/config.inc.php" || true

# Create database and user
sudo mysql -u root <<MYSQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
MYSQL

# Let user know to finish setup in browser
echo "DVWA files placed in ${DVWA_DIR}."
echo "Open http://<UbuntuIP>:8080/DVWA/setup.php in your browser and click Create/Reset Database to finish."
