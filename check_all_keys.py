import re, os

# Gather all defined keys
with open('lib/settings/translations.dart') as f:
    content = f.read()
defined_keys = set(re.findall(r"  '([^']+)'\s*:\s*\{", content))

# Scan all dart files for .tr('key') calls
used_keys = {}
for root, dirs, files in os.walk('lib'):
    for fname in files:
        if not fname.endswith('.dart'):
            continue
        path = os.path.join(root, fname)
        with open(path) as f:
            for i, line in enumerate(f, 1):
                for m in re.finditer(r"\.tr\('([^']+)'\)", line):
                    key = m.group(1)
                    if key not in used_keys:
                        used_keys[key] = []
                    used_keys[key].append(f"{path}:{i}")

missing = []
for key, locs in sorted(used_keys.items()):
    if key not in defined_keys:
        missing.append((key, locs))

if missing:
    print(f"MISSING KEYS ({len(missing)}):")
    for key, locs in missing:
        print(f"  '{key}'")
        for loc in locs[:3]:
            print(f"    used at: {loc}")
else:
    print("All used keys are defined!")
