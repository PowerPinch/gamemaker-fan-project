move_anim = 0;
move_speed = 200;
elevation = 0;
move_flag = false;
attack_flag = false;
jump_flag = false;

//Tile collision info
l = layer_get_id("tile_collision");
tilemap = layer_tilemap_get_id(l);

//Sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);