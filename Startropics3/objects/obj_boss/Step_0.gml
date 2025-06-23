time_rem = round(time_existed mod 5);
if(!attack_flag && (time_rem == 2 || time_rem == 4)) {
	instance_create_layer(x,y,"layer_enemies",choose(obj_skull_emitter,obj_vortex_emitter));
	attack_flag = true;
} else if(!warp_flag && time_rem == 0) { 
	x = choose(32, 256, 512, 768, 1024);
	y = choose(32, 256, 512, 768, 1024);
	attack_flag = false;
	warp_flag = true;
} else if(time_rem == 3) {
	attack_flag = false;
	warp_flag = false;
}
time_existed += delta_time / global.micro;