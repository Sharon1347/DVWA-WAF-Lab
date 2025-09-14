# 05 - Installing & configuring SafeLine WAF

This section follows the SafeLine demo video referenced in the lab (installer command, dashboard port, and quick GUI steps).

## Quick installer (review before running)
SafeLine provides a one-line installer that downloads and runs a remote script. **Review the script before running it**.
```bash
bash -c "$(curl -fsSLk https://waf.chaitin.com/release/latest/manager.sh)" -- --en
```

The video shows accessing the SafeLine dashboard at `https://<host>:9443/` after install. The dashboard is used to create an application (domain), attach an SSL certificate, and configure protections like HTTP flood, Auth sign-in, and custom deny rules.

## Docker requirement & resources
The video notes that SafeLine can be deployed using Docker and Docker Compose; ensure you have Docker >= 20.10.14 and Docker Compose >= 2.0.0 if the installer uses containers.

## GUI steps (as demonstrated)
1. Login to SafeLine dashboard (port 9443).  
2. Import the self-signed certificate (`/etc/ssl/dvwa/dvwa.crt` and `.key`).  
3. Add a new application:
   - Domain: `www.dvwa.local`
   - Port: `443` (WAF listens on HTTPS)
   - Reverse proxy / Backend: `http://<UbuntuIP>:8080`
4. Enable protections: HTTP Flood, Auth Sign-in (if desired), and any custom deny rules.
5. Test by browsing to `https://www.dvwa.local` from Kali and attempt SQLi (DVWA should be protected).

**Safety note:** the installer runs remote code; inspect it before executing. If you prefer, use SafeLine's Docker Compose manual steps instead (vendor docs / video show the options).
