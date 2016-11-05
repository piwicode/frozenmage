// scr_room_init(zoom)

// Initialization of a room with zoom level.
var zoom = argument[0];

if (zoom != 1) {
  view_enabled = true;
  view_visible[0] = true;
  view_hview[0] = global.game_res_height;
  view_wview[0] = global.game_res_width;
  view_hborder[0] = 160
  view_vborder[0] = 64
  view_object[0] = obj_mage;
}

// Initialization of the room framerate.
room_speed = 60;
