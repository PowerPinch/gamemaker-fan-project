for(i = 0; i < 16; i++) {
	new_skull = instance_create_layer(x,y,"layer_enemies",obj_skull);
	new_skull.direction = i * 22.5;
}
instance_destroy();