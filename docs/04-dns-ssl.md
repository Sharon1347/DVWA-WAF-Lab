# 04 - DNS & Self-signed SSL

## /etc/hosts option (easy)
Add this line on both VMs's `/etc/hosts`:
```
<UbuntuIP>    dvwa.local
```

## Self-signed certificate
Commands (run on Ubuntu VM):
```
sudo mkdir -p /etc/ssl/dvwa
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/dvwa/dvwa.key \
 -out /etc/ssl/dvwa/dvwa.crt
```
Then import these into SafeLine (see docs/05-safeline-waf.md).
