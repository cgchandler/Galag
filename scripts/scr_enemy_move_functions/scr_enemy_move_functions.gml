// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_move(object_enemy)
{
	with (object_enemy)
	{
		// move the sprite
		if (y > room_height + sprite_height/2)
		{
			// Moved off bottom of screen
			//if (global.player_state != PLAYER_STATE.dead)
			//{
				// Move enemy back to top
				y = -sprite_height;
				motion_set(irandom_range(225, 315), speed)
			//}
			//else
			//{
			//	// destroy enemy
			//	instance_destroy();
			//}
		}
		else if ((x < (sprite_width/2)) || (x > room_width - (sprite_width/2)))
		{
			// Hit the side of screen - flip the direction
			motion_set(270 + (270 - direction), speed)
		}

		// Randomly fire a missle
		if (global.player_state != PLAYER_STATE.dead)
		{
			if (irandom_range(1, firing_odds) == 1)
			{
				var inst = instance_create_layer(x, y + sprite_height/2, "Instances_missles", obj_missle1)
				inst.direction = 270;
				audio_play_sound(snd_missle, 10, false, 1, 0, .5);
			}
		}

	}
}

function scr_boss_move(object_enemy)
{
	with (object_enemy)
	{
		// move the sprite
		if ((x < (sprite_width/2)) || (x > room_width - (sprite_width/2)))
		{
			// Hit the side of screen - flip the direction
			var new_direction = (direction == 0) ? 180 : 0;
			motion_set(new_direction, speed)
		}

		// Randomly fire a pair of missles
		if (global.player_state != PLAYER_STATE.dead)
		{
			
			if (irandom_range(1, firing_odds) == 1)
			{
				// fire missle 1 on left
				var inst = instance_create_layer(x - 50, y+(sprite_height/2), "Instances_missles", obj_missle1)
				inst.direction = 270;
				// fire missle 2 on right
				var inst = instance_create_layer(x + 50, y+(sprite_height/2), "Instances_missles", obj_missle1)
				inst.direction = 270;
				// play fire sound
				audio_play_sound(snd_missle, 10, false, 1, 0, .5);
			}
		}

	}
}