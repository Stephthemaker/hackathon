import re

with open('lib/settings/translations.dart') as f:
    content = f.read()

keys = set(re.findall(r"  '([^']+)'\s*:\s*\{", content))

test = [
    'home.about.label2', 'home.about.title2', 'home.quick.learn_more',
    'footer.copyright', 'footer.address', 'footer.department', 'footer.links',
    'footer.overview', 'footer.academic', 'footer.researchgroups',
    'footer.programmes', 'footer.resources', 'footer.newsevents',
    'footer.studentres', 'footer.contactus',
    'staff.filter.admin', 'staff.section.academic', 'staff.section.admin',
    'staff.search.hint', 'staff.sort.label', 'staff.empty',
]

for k in test:
    print(k, 'OK' if k in keys else '** MISSING **')
