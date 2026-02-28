import re
with open("lib/ui/widgets/animated_3d_scroll_model.dart", "r") as f:
  c = f.read()
with open("patch.dart", "r") as f:
  p = f.read()
c = re.sub(r"Widget _buildStellenboschLocation.*?}
}", p, c, flags=re.DOTALL)
with open("lib/ui/widgets/animated_3d_scroll_model.dart", "w") as f:
  f.write(c)
