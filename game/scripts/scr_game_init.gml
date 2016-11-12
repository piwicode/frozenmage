/// scr_game_init()

// Game resolution parameters, and image scaling factor.
global.game_res_height = 200;
global.game_res_width = 320;
global.game_res_scale = 4;

// Capture the monitor resolution for scaling.
global.monitor_width = display_get_width();
global.monitor_height = display_get_height();

// Set the window size.
window_set_size(
  global.game_res_width * global.game_res_scale,
  global.game_res_height * global.game_res_scale)

if(false) { // Deactivate bugy rescaling code.
  var scaled_width = 0;
  var scaled_height = 0;
  if (global.game_res_width * global.monitor_height <  global.monitor_height * global.monitor_width) {
    scaled_width = global.monitor_width;
    scaled_height = global.game_res_height * global.monitor_width / global.game_res_width;
  } else {
    scaled_width = global.game_res_width * global.monitor_height / global.game_res_height;
    scaled_height =  global.monitor_height;
  }
  application_surface_draw_enable(false);
  
  surface_resize(application_surface, scaled_width, scaled_height)
  global.Xoffset=(global.monitor_width - scaled_width) / 2;
  global.Yoffset=(global.monitor_height - scaled_height) / 2;
}

// Add debug controls when the debug configuration is selected, otherwise add analytics.
instance_create(0, -32, IIF(DEBUG_CONFIG, obj_debug_tool, obj_google_analytics));

// Now persistent objects are created, go to the first level, or the test room.
room_goto(IIF(debug_mode, rm_lvl_00_intro, rm_lvl_00_intro));  // Go to the test rooms.

enum mage_power {
 none = 0,
 ice = 1,
 wind = 2,
 fire = 3,
}
global.mage_level = mage_power.none;
global.death_count = 0;
global.game_start_timer = get_timer();

