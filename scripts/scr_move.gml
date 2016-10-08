/// scr_move()

// Capture the speed before and after collision test
// to detect the shock intensity if any.
delta_xs = xs;
delta_ys = ys;

// Apply the acceleration to the current speed.
ys += yss;

// Limit maximum speed in both directions.
ys = clamp(ys, -max_speed, max_speed);
xs = clamp(xs, -max_speed, max_speed);

if(false){
var xst = xs; var yst = ys;
if(yst > 0) {yst = max(yst, 1);}
var made_progress = true;
var x_colide = false; var y_colide = false;
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
if x_colide { xs = 0; }
if y_colide { ys = 0; }

} else {
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
}
// Integer position of the object rounded down the the nearest integer.
// This is used to display pixel art sprites alligned with eachother.
// We do not use 'round' because it implements bankers rounding which is not
// relevant to game simulation given that it would cause annimation jittering.
x = floor(xx); y = floor(yy);

// Measure the speed variation over this frame, and
// deduce the intencity of the shock.
delta_xs -= xs; delta_ys -= ys;
