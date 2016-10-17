// Apply the acceleration to the current speed, up to some a maximum speed.
ys = clamp(ys + yss, -max_speed, max_speed);
