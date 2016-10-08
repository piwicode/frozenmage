// scr_room_init(zoom)

// Initialization of a room with zoom level.
var zoom = argument[0];

if (zoom != 1) {
  view_enabled = true;
  view_hview[0] = view_hport[0] / zoom;
  view_wview[0] = view_wport[0] / zoom;
  view_object[0] = obj_mage;
}

// Initialization of the room framerate.
room_speed = 60;
