/// @description Display the points scored

if (state == ENEMY_STATE.exploding)
{
	// Display current hit points in center of object
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var c = c_white;
	draw_text_transformed_color(x, y, string(points), 1, 1, 0, c,c,c,c, 1);
}
