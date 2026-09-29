#!/bin/bash
echo "=== APT Key Security Audit ==="
echo "Keys in new format:"
ls -la /etc/apt/keyrings/
ls -la /usr/share/keyrings/

echo -e "\nRepository files using new format:"
grep -r "signed-by" /etc/apt/sources.list.d/ 2>/dev/null

echo -e "\nOld format keys still present:"
sudo apt-key list 2>/dev/null | grep -E "pub|uid" || echo "None found (good)"

echo -e "\nChecking for deprecated warnings:"
sudo apt update 2>&1 | grep -i "deprecated\|apt-key" || echo "No warnings found"
