if(!reverse && (point_distance(xorig, yorig, x, y) < distance)) {
	x += move_speed * delta_time/global.micro * dcos(direction);
	y -= move_speed * delta_time/global.micro * dsin(direction);
    xmax = x;
	ymax = y;
} else {
	reverse = true;
	x -= move_speed * delta_time/global.micro * dcos(direction);
	y += move_speed * delta_time/global.micro * dsin(direction);
	if(point_distance(xmax, ymax, x, y) > distance) {
		player.attack_flag = false;
		instance_destroy();
	}
}