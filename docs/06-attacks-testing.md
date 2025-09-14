# 06 - Attacks & testing

1. From Kali, browse to `http://dvwa.local:8080/DVWA` or the WAF URL depending on your setup.
2. If SafeLine is enabled as a reverse proxy, use the WAF URL (e.g., `https://www.dvwa.local`) which the WAF will forward to the backend.
3. Login to DVWA (default `admin/password`) and set security to "low".
4. Try SQL injection strings (`' OR '1'='1`) and observe the response — if SafeLine is blocking, you'll see a WAF block page or HTTP 403, and the backend Apache logs will NOT contain the malicious request.
5. In SafeLine dashboard (port 9443), check Events / Logs for a matching rule (e.g., SQLi signature) and action=BLOCK. Filter by source IP (your Kali VM) and time to find the event.

**Automation demo:** `scripts/sql_injection_demo.sh` runs simple curl tests to simulate attacks (read the script before running). Note: DVWA pages may have CSRF tokens and require browser interaction for some tests.
