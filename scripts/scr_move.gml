// scr_move()

// Detect collisions with solid objects
if place_meeting(x + xs, y, obj_solid) {
  while(!place_meeting(x + sign(xs), y, obj_solid)) x += sign(xs);
  xs = 0;
}

if place_meeting(x, y + ys, obj_solid) {
  while(!place_meeting(x , y + sign(ys), obj_solid)) y += sign(ys);
  ys = 0;
}

// Apply speed corrected by collision to the sprite.
x += xs;
y += ys;
