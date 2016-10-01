// scr_move()

// Detect collisions with solid objects
// It is not possible to use move_contact_xxx with a spcific object class
// Using instance_meeting only retunrs one instance which does not make possible
// to compute the distance to a safe place in the case two object are colliding.
if place_meeting(x + xs, y, obj_solid) {
  while(!place_meeting(x + sign(xs), y, obj_solid)) x += sign(xs);
  xs = 0;
}

if place_meeting(x, y + ys, obj_solid) {
  while(!place_meeting(x , y + sign(ys), obj_solid)) y += sign(ys);
  ys = 0;
}

// Apply the correcteed speed to the object coordinates.
x += xs;
y += ys;
