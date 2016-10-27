// scr_auto_tile
var tile_size = 8
var tile_padding = 1
// scr_auto_tile()
var tileset = bg_auto_tile
var tile_depth = 100;
var object = obj_collision_16x16
object_set_visible(object, false);
var xx = 0; var
for(var xx = 0; xx < room_width ; xx += tile_size) {
  for(var yy = 0; yy < room_height ; yy += tile_size) {
    var xxx = xx + tile_size * .5;
    var yyy = yy + tile_size * .5;
    if(collision_point(xxx, yyy, object, false /*precise*/, true/*notme*/ )) {
      var t = collision_point(xxx, yyy - tile_size, object, false, true) == noone;
      var r = collision_point(xxx + tile_size, yyy, object, false, true) == noone;
      var l = collision_point(xxx - tile_size, yyy, object, false, true) == noone;
      var b = collision_point(xxx, yyy + tile_size, object, false, true) == noone;
      tile_add(tileset,
               tile_padding + (t + 2 * r) * (tile_size + tile_padding),
               tile_padding + (b + 2 * l) * (tile_size + tile_padding),
               tile_size, tile_size, xx, yy, tile_depth);
    }
  }
}



