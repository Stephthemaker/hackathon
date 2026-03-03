import re

extra_translations = """
  'home.stats.inafrica': {
    AppLocale.en: 'In Africa*',
    AppLocale.af: 'In Afrika*',
    AppLocale.xh: 'E-Afrika*',
  },
"""

with open('lib/settings/translations.dart', 'r') as f:
    text = f.read()

idx = text.rfind('};')
if idx != -1:
    text = text[:idx] + extra_translations + text[idx:]
    with open('lib/settings/translations.dart', 'w') as f:
        f.write(text)
