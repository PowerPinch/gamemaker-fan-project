if(wait_timer > 0) {
	wait_timer -= delta_time/global.micro;
	if(wait_timer <= 0) {
		move_timer = enemy_move_time;
		enemy_angle_toward_player = arctan2(instance_find(obj_player, 0).y - y, instance_find(obj_player, 0).x - x);
	}
} else if(move_timer > 0) {
	if(abs(cos(enemy_angle_toward_player)) > abs(sin(enemy_angle_toward_player))) {
		x += sign(cos(enemy_angle_toward_player)) * enemy_speed * delta_time/global.micro;
	} else {
		y += sign(sin(enemy_angle_toward_player)) * enemy_speed * delta_time/global.micro;
	}
	move_timer -= delta_time/global.micro;
	if(move_timer <= 0) {
		wait_timer = enemy_wait_time;
	}
}