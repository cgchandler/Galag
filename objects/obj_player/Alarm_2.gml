/// @description Add Enemy 2 to new wave

// caclulate number of enemy2 for this wave
//var enemy2_count = floor(global.enemy_wave / global.enemy2_wave_number);
//repeat(enemy2_count)
if (global.enemy_wave >= global.enemy2_wave_number)
{
	repeat(enemy2_wave_count) 
	{
		var xx = irandom_range(sprite_width/2, room_width - sprite_width/2);
		var yy = -sprite_height;
		instance_create_layer(xx, yy, "Instances", obj_enemy2);
	}

	// add any enemy 2 objects with a slight delay
	alarm[3] = enemy3_wave_pause;
}