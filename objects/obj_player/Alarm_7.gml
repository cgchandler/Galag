/// @description Random Power Up

// Randomly Create a Power Up
if (global.player_state != PLAYER_STATE.dead) 
{
	// only allow one power-up at a time
	if (instance_number(obj_power_up) < 1)
	{
		// randomly generate the power up
		if (irandom_range(1, global.powerup_odds ) == 1)
		{
			var power_up = choose(obj_pu_free_life, obj_pu_bomb, obj_pu_bomb);
			var xx = irandom_range(sprite_width/2, room_width - sprite_width/2);
			var yy = 0;
			var inst = instance_create_layer(xx, yy, "Instances_missles", power_up);
			//audio_play_sound(snd_missle, 10, false, 1, 0, .5);
		}
	}
}
	





