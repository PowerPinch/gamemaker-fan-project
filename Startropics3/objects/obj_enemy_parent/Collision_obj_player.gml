if(other.invuln_frames <= 0) {
	health-=enemy_damage;
	if(health <= 0) {
		player_death();
	}
	other.invuln_frames = 2;
}