// scr_move()

// Detect collisions with solid objects.

// It is not possible to use move_contact_xxx with a spcific object class
// Using instance_meeting only retunrs one instance which does not make
// possible to compute the distance to a safe place in the case two object
// are colliding.

// All collision operations are performed on rounded coordinate to avoid
// entering the walls.
// TODO: review the code to align xx and yy on integers when colliding.

if place_meeting(floor(xx + xs), floor(yy), obj_solid) {
  while(!place_meeting(floor(xx + sign(xs)), floor(yy), obj_solid)) {
    xx += sign(xs);
  }
  xs = 0;
}

if place_meeting(floor(xx), floor(yy + ys), obj_solid) {
  while(!place_meeting(floor(xx) , floor(yy + sign(ys)), obj_solid)) yy += sign(ys);
  ys = 0;
}

// Apply the correcteed speed to the object coordinates.
xx += xs; yy += ys;

x = floor(xx); y = floor(yy);
