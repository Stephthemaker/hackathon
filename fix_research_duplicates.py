import os

file_path = '/Users/stephhenning/Documents/university/2026/other/hackathon/lib/pages/research_page.dart'
with open(file_path, 'r') as f:
    lines = f.readlines()

new_lines = []
skip_until = None

for i, line in enumerate(lines):
    if skip_until is not None:
        if skip_until in line:
            skip_until = None
        continue

    # Remove the duplicate _Link class and broken _RG closing
    if 'class _Link {' in line:
        # Check if we already added a _Link class
        if any('class _Link {' in l for l in new_lines):
            skip_until = '}'
            continue
    
    if 'const _RG({' in line:
       # We keep the _RG class but fix the botched closing
       pass
    
    if '});' in line and i < 75: # Botched lines are early
        if i >= 65 and i <= 70:
            continue
    
    # Remove duplicate officialLinks entries in the data
    if 'officialLinks: [' in line:
        # Check if previous significant lines already have officialLinks
        # Simple heuristic: if we just added one, skip the next one
        is_dup = False
        for prev in reversed(new_lines[-5:]):
            if 'officialLinks: [' in prev:
                is_dup = True
                break
        if is_dup:
            skip_until = '],'
            continue

    new_lines.append(line)

# Final cleanup of the multiple });
cleaned = "".join(new_lines)
# Re-fix the _RG class closing which might have been mangled
cleaned = cleaned.replace("    this.officialLinks = const [],\n  });\n});\n});\n});\n}", "    this.officialLinks = const [],\n  });\n}")

with open(file_path, 'w') as f:
    f.write(cleaned)
