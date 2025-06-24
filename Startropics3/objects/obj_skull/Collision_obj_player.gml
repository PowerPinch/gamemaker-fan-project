if(!other.jump_flag) {
	health-=projectile_damage; 
	other.invuln_frames = 2;
	if(health <= 0) {
		player_death();
	}
}
