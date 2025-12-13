/// @description Reduce Lives & Destory Instance?

if (global.player_state == PLAYER_STATE.exploding)
{
	lives--;

	if (lives < 1)
	{
		// Make sure the gamepad isn't vibrating
		if (game_pad_id >=0 ) gamepad_set_vibration(game_pad_id, 0, 0);
		// destroy the player object
		instance_destroy();
	}
	else
	{
		//x = room_width/2;
		global.player_state = PLAYER_STATE.dead;
		if (score > global.high_score)
		{
			global.high_score = score;
			highscore_save();
		}
	}
}

if (global.player_state == PLAYER_STATE.dead) && (!player_regeneration_triggered)
{
	alarm[5] = player_regeneration_pause;
	player_regeneration_triggered = true;
}
