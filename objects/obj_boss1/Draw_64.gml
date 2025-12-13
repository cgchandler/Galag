/// @description Display the enemy health bar

event_inherited();

if (state == ENEMY_STATE.good) || (state == ENEMY_STATE.damaged)
{
	// display the health bar
	var bar_width = sprite_width / 2;
	var bar_height = 16;
	var health_percent = (enemy_health / enemy_health_max) * 100;
	var xx = x - (bar_width / 2);
	var yy = y - sprite_height + 50;
	draw_healthbar(xx, yy, xx + bar_width, yy + bar_height, health_percent, c_grey, c_red, c_lime, 0, true, true)

//	// Display current hit points in center of health bar
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_middle);
//	var c = c_white;
//	draw_text_transformed_color(x, yy + (bar_height / 2), string(enemy_health), 1, 1, 0, c,c,c,c, 1);
}