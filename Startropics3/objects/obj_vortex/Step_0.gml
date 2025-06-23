x += move_speed * delta_time/global.micro * dcos(direction);
y -= move_speed * delta_time/global.micro * dsin(direction);
if(dt > 1) {
	instance_destroy();	
}
dt += delta_time/global.micro