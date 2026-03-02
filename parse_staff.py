import re

with open('staff_list.html', 'r') as f:
    content = f.read()

names = [
    'Brink van der Merwe', 'Bernd Fischer', 'Lynette van Zijl', 
    'Andries Engelbrecht', 'Willem Visser', 'Steve Kroon', 
    'Cornelia Inggs', 'Trienko Grobler'
]

print("--- Staff URLs ---")
for name in names:
    # Find the occurrence of the name
    idx = content.find(name)
    if idx != -1:
        # Search for a link starting AFTER the name, within a reasonable distance (e.g., 500 chars)
        # Look specifically for <span class="www"> or <a href="..."> Website
        search_area = content[idx:idx+800]
        # Pattern 1: <span class="www"><a href="...">
        m1 = re.search(r'class="www">\s*<a href="([^"]+)"', search_area)
        if m1:
            print(f"{name}: {m1.group(1)}")
            continue
        
        # Pattern 2: Any <a href="...">Website</a>
        m2 = re.search(r'<a href="([^"]+)">Website</a>', search_area)
        if m2:
            print(f"{name}: {m2.group(1)}")
            continue

        # Fallback: Just the next href
        m3 = re.search(r'<a href="([^"]+)"', search_area)
        if m3:
            print(f"{name}: {m3.group(1)} (fallback)")
        else:
            print(f"{name}: Not found link")
    else:
        print(f"{name}: Name not found in HTML")
