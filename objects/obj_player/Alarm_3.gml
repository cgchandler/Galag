/// @description Add Enemy 3 to new wave

// caclulate number of enemy3 for this wave
//var enemy3_count = floor(global.enemy_wave / global.enemy3_wave_number);
//repeat(enemy3_count) 
if (global.enemy_wave >= global.enemy3_wave_number)
{
	repeat(enemy3_wave_count) 
	{
		var xx = irandom_range(sprite_width/2, room_width - sprite_width/2);
		var yy = -sprite_height;
		instance_create_layer(xx, yy, "Instances", obj_enemy3);
	}
}
