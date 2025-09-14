# Troubleshooting common issues

- Apache won't start: check `sudo journalctl -u apache2` and `/var/log/apache2/error.log`.
- DVWA database errors: ensure DB credentials in `config/config.inc.php` match MySQL user.
- WAF not proxying: check that backend URL uses the correct port and firewall rules allow traffic.
