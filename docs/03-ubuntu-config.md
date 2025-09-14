# 03 - Ubuntu configuration (LAMP + DVWA)

Steps in short:
1. Update system: `sudo apt update && sudo apt upgrade -y`.
2. Install packages: Apache, PHP, MySQL: see `scripts/setup_lamp.sh`.
3. Install DVWA (git clone into `/var/www/html/DVWA`), set permissions, create database and user (script automates this but shows commands clearly).
4. Use Apache on port 8080 (see `configs/apache_ports.conf`).

If anything fails, check `/var/log/apache2/error.log` and MySQL logs.
