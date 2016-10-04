/// scr_move()

// Detect collisions with solid objects.

// It is not possible to use move_contact_xxx with a spcific object class
// Using instance_meeting only retunrs one instance which does not make
// possible to compute the distance to a safe place in the case two object
// are colliding.

// All collision operations are performed on rounded coordinate to avoid
// entering the walls.

// Apply the acceleration to the current speed.
ys += yss;

// Limit maximum speed in both directions.
ys = clamp(ys, -max_speed, max_speed);
xs = clamp(xs, -max_speed, max_speed);

var yy_target = yy + ys;
if (ys != 0) {
  // Integer position equal or beyond the reached point.
  var y_max = ceil((yy_target) * sign(ys)) * sign(ys);
  if (place_meeting(floor(xx), y_max, obj_entity)) {
    yy_target = ceil(yy * sign(ys)) * sign(ys) + sign(ys);
    while(!place_meeting(floor(xx), yy_target, obj_entity)) {
      yy_target += sign(ys);
    }
    yy_target -= sign(ys);
    ys = 0;
  }
}
yy = yy_target;

var xx_target = xx + xs;
if (xs != 0) {
  // Integer position equal or beyond the reached point.
  var x_max = ceil((xx_target) * sign(xs)) * sign(xs);
  if (place_meeting(x_max, floor(yy), obj_entity)) {    
    xx_target = ceil(xx * sign(xs)) * sign(xs) + sign(xs);
    while(!place_meeting(xx_target, floor(yy), obj_entity)) {
      xx_target += sign(xs);
    }
    xx_target -= sign(xs);
    xs = 0;   
  }
}
xx = xx_target;
// Integer position of the object rounded down the the nearest integer.
// This is used to display pixel art sprites alligned with eachother.
// We do not use 'round' because it implementes bankers rounding which is not
// relevant to game simulation given that it would cause aninmation jittering.

x = floor(xx); y = floor(yy);
