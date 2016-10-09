// Speed over x and y axes.
xs = 0; ys = 0;
xst = 0; yst = 0; // Reminder speed from the last step.
// Non integer position of the object.
// x = floor(xx) and y = floor(yy)
xx = x; yy = y;

// Acceleration: gravity is a vertical acceleration toward the bottom.
yss = 0.2;

// Maximum absolute value of the horizontal and vertical speed.
max_speed = 30;

// Horizontal friction applied when aiming.
const_aim_x_friction = .5;

do_die = 0;
