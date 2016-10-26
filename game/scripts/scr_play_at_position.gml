/// scr_play_at_position(resource_idx, intensity, loop)
var resource_idx = argument[0]
var intensity = 1.;
if(argument_count >= 2) intensity = argument[1]
var loop = false;
if(argument_count >= 3) loop = argument[2]

var distance_from_view = max(
  0,
  view_xview[0] - x,
  x - (view_xview[0] + view_wview[0]),
  view_yview[0] - y,
  y - (view_yview[0] + view_hview[0]));

var max_distance = 120
var volume = intensity * max(max_distance - distance_from_view, 0) / max_distance;
var sound_instance = audio_play_sound(resource_idx, 50, loop);
audio_sound_gain(sound_instance, volume, 0);
return sound_instance
