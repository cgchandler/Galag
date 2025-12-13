// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_player_hit(object_player, object_other)
{

	// play the explosion sound
	audio_play_sound(snd_missle1_explosion, 10, false);

	// Explode the player
	global.player_state = PLAYER_STATE.exploding;

	// Explode the enemy/missle
	with (object_other)
	{
		state = ENEMY_STATE.exploding;
		speed = 0;
		direction = 270;	// headed down
		image_angle = 180;	// flip the ship upside down for attacking from the top
	}

}

function scr_weapon_hit_enemy(object_weapon, object_enemy)
{

	//if ((object_enemy.state != ENEMY_STATE.exploding) || (object_enemy.state != ENEMY_STATE.dead))
	//	&& (object_weapon.state != WEAPON_STATE.exploding)
	with (object_enemy)
	{
		if (state == ENEMY_STATE.good) || (state == ENEMY_STATE.damaged)  
		{

			state = ENEMY_STATE.damaged;

			// Explode the missle
			object_weapon.state = WEAPON_STATE.exploding;

			audio_play_sound(snd_missle1_explosion, 10, false);

			enemy_health -= object_weapon.damage;
			if (enemy_health < 1)
			{			
				// Explode the enemy
				state = ENEMY_STATE.exploding;
				speed = 0;
				if (enemy_type != ENEMY_TYPE.boss1)
				{
					direction = 270;	// headed down
					image_angle = 180;	// flip the ship upside down for attacking from the top
				}

				// Increase the Score
				increase_score(points);

			}
		}				
	}

}

function scr_weapon_hit_missle(object_weapon, object_missle)
{

	if (object_weapon.state == WEAPON_STATE.good)
	{

		// play the explosion sound
		audio_play_sound(snd_missle1_explosion, 10, false);

		// Explode the weapon
		object_weapon.state = WEAPON_STATE.exploding;

		// Explode the enemy missle
		with (object_missle)
		{
			state = WEAPON_STATE.exploding;
			speed = 0;
			direction = 270;	// headed down
			image_angle = 180;	// flip the ship upside down for attacking from the top
		}

		// Increase the Score
		increase_score(object_missle.points);

	}
	
}

function scr_player_hit_powerup(object_player, object_powerup)
{
	switch (object_powerup.type)
	{
		case POWER_UP_TYPE.free_life:
			if (object_powerup.state == POWER_UP_STATE.good)
			{
				free_life();
				object_powerup.state = POWER_UP_STATE.pick_up;
			}
			break;
	
		case POWER_UP_TYPE.bomb:
			if (object_powerup.state == POWER_UP_STATE.good)
			{
				free_bombs(10);
				object_powerup.state = POWER_UP_STATE.pick_up;
			}
			break;
			
		default:
			// invalid power up type - do nothing
			break;
	}
}

function increase_score(points)
{
	// caclulate next free life
	var free_life_score = floor((score + global.extra_life_score) / global.extra_life_score) * global.extra_life_score;
	score += points;
	if (score >= free_life_score)
	{
		free_life();
	}
}

function free_life()
{
	lives++;
	audio_play_sound(snd_extra_life, 20, false);
}

function free_bombs(bomb_count)
{
	global.bomb_count += bomb_count;
	audio_play_sound(snd_upgrade, 20, false);
}