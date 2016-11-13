/// scr_move()

// Capture the speed before and after collision test to detect the shock
// intensity if any.
delta_xs = -xs; delta_ys = -ys;
delta_x = -x; delta_y = -y;

// Apply the acceleration to the current speed.
ys += yss;

// Limit maximum speed in both directions.
ys = clamp(ys, -max_speed, max_speed);
xs = clamp(xs, -max_speed, max_speed);

xst += xs;
yst += ys;
var made_progress = true;
x_colide = false; y_colide = false;
while (made_progress) {
  made_progress = false;
  if (abs(yst) >= 1) {
    y_colide = place_meeting(floor(xx), floor(yy) + sign(yst), obj_entity);
    if (!y_colide) { yy += sign(yst); yst -= sign(yst); made_progress = true; }
  }  
  if (abs(xst) >= 1) {
    x_colide = place_meeting(floor(xx) + sign(xst), floor(yy), obj_entity);
    if (!x_colide) { xx += sign(xst); xst -= sign(xst); made_progress = true; }
  }
}
if x_colide { xs = 0; xst = 0;}
if y_colide { ys = 0; yst = 0;}

// Integer position of the object rounded down the the nearest integer.
// This is used to display pixel art sprites alligned with eachother.
// We do not use 'round' because it implements bankers rounding which is not
// relevant to game simulation given that it would cause annimation jittering.
x = floor(xx); y = floor(yy);

// Measure the speed variation over this frame, and deduce the intencity of the
// shock.
delta_xs += xs; delta_ys += ys;
delta_x += x; delta_y += y;

