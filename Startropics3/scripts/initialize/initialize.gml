function initialize() {
	global.micro = 1000000;
	global.kb_up = ord("W");
	global.kb_down = ord("S");
	global.kb_left = ord("A");
	global.kb_right = ord("D");
	global.kb_shoot = vk_enter;
	global.kb_jump = vk_space;

	// Controller settings - default mappings
	global.gp = array_create(8);
	global.ctrl_up = gp_padu;
	global.ctrl_down = gp_padd;
	global.ctrl_left = gp_padl;
	global.ctrl_right = gp_padr;
	global.ctrl_shoot = gp_face1;
	global.ctrl_jump = gp_face3;

	global.framerate = 9999;
	health = 6;
	lives = 3;


}
