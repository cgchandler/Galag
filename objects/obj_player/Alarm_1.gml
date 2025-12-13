/// @description Start a new wave

//if (global.enemy_count < 1)
//   || ((global.enemy_count == 1) && (instance_number(obj_boss1) == 1))
if (instance_number(obj_enemy) < 1)
   || ((instance_number(obj_enemy) == 1) && (instance_number(obj_boss1) == 1))
{
	// start new wave
	
	// calculate the number of each type of enemy for the wave start
	enemy3_wave_count = floor(global.enemy_wave / global.enemy3_wave_number);
	enemy2_wave_count = floor(global.enemy_wave / global.enemy2_wave_number);
	enemy1_wave_count = global.enemy_wave - enemy3_wave_count - enemy2_wave_count;

	repeat(enemy1_wave_count) 
	{
		var xx = irandom_range(sprite_width/2, room_width - sprite_width/2);
		var yy = -sprite_height;
		instance_create_layer(xx, yy, "Instances", obj_enemy1);
	}
	
	waiting_for_next_wave = false;

	global.is_boss_dead = false;

	// add any enemy 2 objects with a slight delay
	alarm[2] = enemy2_wave_pause;
}
