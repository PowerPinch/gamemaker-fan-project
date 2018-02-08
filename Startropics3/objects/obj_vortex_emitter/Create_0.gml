player = instance_find(obj_player, 0);
for(i = 0; i < 16; i++) {
	new_vortex = instance_create_layer(x,y,"layer_enemies",obj_vortex);
	new_vortex.direction = i * 22.5;	
	new_vortex.x = player.x - 600 * dcos(new_vortex.direction);
	new_vortex.y = player.y + 600 * dsin(new_vortex.direction);
}
instance_destroy();