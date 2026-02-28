import urllib.request
import urllib.parse
import json
import re
from html import unescape

query = "Stellenbosch University corporate identity brand manual guidelines primary hex color typography"
url = f"https://html.duckduckgo.com/html/?q={urllib.parse.quote(query)}"
req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
try:
    html = urllib.request.urlopen(req).read().decode('utf-8')
    snippets = re.findall(r'<a class="result__snippet[^>]*>(.*?)</a>', html, re.IGNORECASE | re.DOTALL)
    for i, s in enumerate(snippets[:10]):
        clean_text = unescape(re.sub(r'<[^>]+>', '', s)).strip()
        print(f"{i+1}. {clean_text}")
except Exception as e:
    print(f"Error: {e}")
