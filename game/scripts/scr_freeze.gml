///scr_freeze()
ice_cube = instance_create(x, y, obj_icecube);
        
// Save the frozen object to restore later.
// For un unknown reason, 'other' is -2 which is not the instance id.
// A workaround consist in getting the id of other.
ice_cube.frozen_object = id; 
instance_deactivate_object(self);

// Create a dummy object attached to the cube to display the frozen content.
ice_cube.frozen_image = instance_create(x, y, obj_frozen_content);
ice_cube.frozen_image.image_speed = 0;
ice_cube.frozen_image.image_index = image_index;
ice_cube.frozen_image.sprite_index = sprite_index;
ice_cube.frozen_image.image_xscale = image_xscale;
ice_cube.frozen_image.image_yscale = image_yscale;

// Register an alarm to melt the cube.
ice_cube.alarm[0] = room_speed * 5;

if(object_index == obj_water) {
  with(instance_place(x+1, y, obj_water)) alarm[0] = room_speed * .1;
  with(instance_place(x-1, y, obj_water)) alarm[0] = room_speed * .1;
}
