draw_sprite(spr_player_shadow, 0, x, y);
draw_sprite(spr_player, move_anim, x, jump_flag ? y - 100 : y);

draw_text(32, 32, "Life = " + string(health));