if(!attack_flag) {
	move_flag = false;
	// Number is move_anim, for drawing the player character
	//			 UP  6
	//		LU	4	 RU	1
	//LEFT	3			 RIGHT 0
	//		LD	5	 RD	2
	//			DOWN 7
	// To make diagonals +1 for up +2 for down if already moving left or right
	if(keyboard_check(ord(global.kb_right)) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0.1)) {
		move_anim = 0;
		move_flag = true;
		x += move_speed * delta_time/global.micro;
		t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
		if(t1 != 0 || t2 != 0) {
			x = ((bbox_right & ~63) - 1) - sprite_bbox_right;
		}
	} else if(keyboard_check(ord(global.kb_left)) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < -0.1)) {
		move_anim = 3;
		move_flag = true;
		x -= move_speed * delta_time/global.micro
		t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		t2 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
		if(t1 != 0 || t2 != 0) {
			x = ((bbox_left + 64) & ~63) - sprite_bbox_left;
		}
	}

	if(keyboard_check(ord(global.kb_up)) || gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < -0.1)) {
		if(move_flag) { 
			move_anim += 1;
		} else {
			move_anim = 6;
			move_flag = true;
		}
		y -= move_speed * delta_time/global.micro
		t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
		t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
		if(t1 != 0 || t2 != 0) {
			y = ((bbox_top + 64) & ~63) - sprite_bbox_top;
		}
	} else if(keyboard_check(ord(global.kb_down)) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.1)) {
		if(move_flag) {
			move_anim += 2;
		} else {
			move_anim = 7;
			move_flag = true;
		}
		y += move_speed * delta_time/global.micro
		t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		if(t1 != 0 || t2 != 0) {
			y = ((bbox_bottom & ~63) - 1) - sprite_bbox_bottom;
		}
	}
	
	if(keyboard_key_press(ord(vk_enter)) || gamepad_button_check_pressed(0, gp_face3) || mouse_check_button_pressed(mb_left)) {
		attack_flag = true;
		switch(move_anim) {
			case 0:
				attack_angle = 0;
				break;
			case 1:
				attack_angle = 45;
				break;
			case 2:
				attack_angle = 315;
				break;
			case 3:
				attack_angle = 180;
				break;
			case 4:
				attack_angle = 135;
				break;
			case 5:
				attack_angle = 215;
				break;
			case 6:
				attack_angle = 90;
				break;
			case 7:
				attack_angle = 270;
				break;
			default:
				attack_angle = 0;
				break;
		}
		if(attack_angle >= 180) {
			instance_create_layer(x, y, "layer_weapon_upper", obj_star);
		} else {
			instance_create_layer(x, y, "layer_weapon_lower", obj_star);		
		}	
	}
}
if(!jump_flag && (keyboard_key_press(ord(global.kb_jump)) || gamepad_button_check_pressed(0, gp_face1))) {
	jump_flag = true;
	jump_time = 0;
	move_speed = 100;
	elevation++;
} else if(jump_flag) {
	jump_time += delta_time / global.micro;
	if(jump_time > 0.5) {
		jump_flag = false;
		move_speed = 200
		//TODO: add ground check to decide whether or not to change elevation
		elevation--;
	}
}