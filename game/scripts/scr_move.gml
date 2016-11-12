/// scr_move()

// Capture the speed before and after collision test
// to detect the shock intensity if any.
delta_xs = xs; delta_ys = ys;
delta_x = -x; delta_y = -y;
// Apply the acceleration to the current speed.
ys += yss;

// Limit maximum speed in both directions.
ys = clamp(ys, -max_speed, max_speed);
xs = clamp(xs, -max_speed, max_speed);


switch(4) {

case 4:
  xst += xs;
  yst += ys;
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
  if x_colide { xs = 0; xst = 0;}
  if y_colide { ys = 0; yst = 0;}
break;

case 3:
  // Move to destination and go back til colliding.
  // Broken!
  // BUG: Causes colliding object to teleport. Super bad.
  xx += xs;
  var xs_sign = sign(xs)
  if(xs_sign != 0){
    while(place_meeting(xx, yy, obj_entity)) {
      xx = ceil(xx * xs_sign) * xs_sign - xs_sign; xs = 0;
    }
  }
  yy += ys;
  var ys_sign = sign(ys)
  if(ys_sign != 0){  
    while(place_meeting(xx, yy, obj_entity)) {
      yy = ceil(yy * ys_sign) * ys_sign - ys_sign; ys = 0;
    }
  }
break;

case 2:
  // Move pixel per pixel until colliding.
  // BUG: Forced speed causes annimation jittering when accelerating.
  xst = xs; yst = ys;
  if(abs(xst) < 1) {xst = sign(xst);} // To be removed causes jittering!
  if(abs(yst) < 1) {yst = sign(yst);}
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
break;

case 1:
  // Test destination and if colliding iterate from current position to destination.
  // Can cause stuck objects.
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
  
break;
}
  if(0 && (xs !=0 || ys !=0 || delta_xs != 0))
  show_debug_message(
    "pos=" + string(xx)+ ", " + string(yy) +
    " vel="+ string(delta_xs)+ ", " + string(delta_ys)
    //" col="+ string(ycol)+ ", " + string(xcol)
    )
// Integer position of the object rounded down the the nearest integer.
// This is used to display pixel art sprites alligned with eachother.
// We do not use 'round' because it implements bankers rounding which is not
// relevant to game simulation given that it would cause annimation jittering.
x = floor(xx); y = floor(yy);

// Measure the speed variation over this frame, and
// deduce the intencity of the shock.
delta_xs -= xs; delta_ys -= ys;
delta_x += x; delta_y += y;
