
import re
import requests
import sys

try:
    with open('lib/sections/portfolio_section.dart', 'r', encoding='utf-8') as f:
        content = f.read()
except Exception as e:
    print(f"Error reading file: {e}")
    sys.exit(1)

urls = re.findall(r'(https?://[^\s"\']+)', content)
print(f"Found {len(urls)} URLs.")

for url in urls:
    try:
        # Some servers don't like HEAD, so we can try GET with stream=True to avoid downloading body
        response = requests.get(url, timeout=5, stream=True)
        if response.status_code >= 400:
            print(f"FAIL: {url} (Status: {response.status_code})")
        else:
            # print(f"OK: {url}")
            pass
    except Exception as e:
        print(f"FAIL: {url} (Error: {e})")
