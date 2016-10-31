///scr_freeze()

// Create the icecube that the place of the frozen object.
var ice_cube = instance_create(x, y, obj_icecube);

// Resolve collisions with surrounding by translating the cube.
// This is done to avoid collision with another ennemy that would get stuck in
// the icecube. Colliding with a wall or the mage is not an issue.
with(ice_cube) {
  // Compute horizontal translation to take the cube out of the collision.
  with(instance_place(x, y, obj_orc)) {
    // Move right if it helps.
    // other: cube           [------]
    // self: object    [-------]
    var left_overlap = bbox_right - ice_cube.bbox_left + 1
    // Move left if it helps.
    // other: cube     [------]
    // self: object         [-------]
    var right_overlap = bbox_left - ice_cube.bbox_right - 1
    // Apply the smallest displacement to solve the collision.
    if(abs(left_overlap) < abs(right_overlap)) {
      ice_cube.x += left_overlap;
    } else {
      ice_cube.x += right_overlap;       
    }
    ice_cube.xx = ice_cube.x;
  }    
}        


// Save the frozen object to restore later.
// For un unknown reason, 'other' is -2 which is not the instance id.
// A workaround consist in getting the id of other.
ice_cube.frozen_object = id; 

// Create a dummy object attached to the cube to display the frozen content.
ice_cube.frozen_image = instance_create(ice_cube.x, ice_cube.y, obj_frozen_content);
instance_deactivate_object(self);
ice_cube.frozen_image.image_speed = 0;
ice_cube.frozen_image.image_index = image_index;
ice_cube.frozen_image.sprite_index = sprite_index;
ice_cube.frozen_image.image_xscale = image_xscale;
ice_cube.frozen_image.image_yscale = image_yscale;

// When water is frozen, it causes a reaction chain and freeze all the neighbor tiles.
if(object_index == obj_water) {
  with(instance_place(x + 1, y, obj_water)) alarm[0] = room_speed * .1;
  with(instance_place(x - 1, y, obj_water)) alarm[0] = room_speed * .1;
} else {
  
}
