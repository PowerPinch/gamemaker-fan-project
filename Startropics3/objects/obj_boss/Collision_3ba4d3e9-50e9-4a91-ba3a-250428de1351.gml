hitpoints--;
with(other) {
	mask_index = spr_empty;
}

if(hitpoints < 0) {
	instance_destroy();	
}