return max(
  0,
  view_xview[0] - x,
  x - view_xview[0] - view_wview[0],
  view_yview[0] - y,
  y - view_yview[0] - view_hview[0]);
