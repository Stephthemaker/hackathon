import urllib.request
import urllib.parse
import re
from html import unescape

query = "Stellenbosch University brand color hex"
url = f"https://html.duckduckgo.com/html/?q={urllib.parse.quote(query)}"
req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
try:
    html = urllib.request.urlopen(req).read().decode('utf-8')
    snippets = re.findall(r'<a class="result__snippet[^>]*>(.*?)</a>', html, re.IGNORECASE | re.DOTALL)
    for i, s in enumerate(snippets[:10]):
        print(f"{i+1}. {unescape(re.sub(r'<[^>]+>', '', s)).strip()}")
except Exception as e:
    print(f"Error: {e}")
