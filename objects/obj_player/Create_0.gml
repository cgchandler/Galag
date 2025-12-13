/// @description Variable & GamePad Init

randomize();

//var lay_id = layer_get_id("Background");
//layer_y(lay_id, global.background_yoffset);

// for creating a time out between missle shots
fire_cooldown = false;
fire_max = 5;
fire_interval = room_speed * 0.3; // 300 milliseconds

missle_cooldown = false;
missle_max = 2;
missle_interval = room_speed * 0.5; // 500 milliseconds

bomb_cooldown = false;
bomb_max = 1;
bomb_interval = room_speed * 1; // 


// Current enemy wave
//global.enemy_wave = 0;
//global.enemy_count = 0;
waiting_for_next_wave = false; // are we waiting for the next wave to start?
enemy_wave_pause = room_speed * 1.5;  // seconds
enemy2_wave_pause = room_speed * 1.5;
enemy3_wave_pause = room_speed * 1.5;

power_up_pause = room_speed * 3;

regenerate_boss_wave_pause = room_speed * 3;
waiting_to_regenerate_boss_wave = false;

player_regeneration_pause = room_speed * 3;
player_regeneration_triggered = false;

// Counts of enemies for current wave
enemy1_wave_count = 0;
enemy2_wave_count = 0;
enemy3_wave_count = 0;

// Start the Theme Music
//audio_play_sound(snd_space_theme, 5, true);

//global.player_is_alive = true;
//state = PLAYER_STATE.idle;
global.player_state = PLAYER_STATE.idle;

// setup the gamepad
var max_pads = gamepad_get_device_count();
game_pad_id = -1;
for (var game_pad = 0; game_pad < max_pads; game_pad++)
{
    if (gamepad_is_connected(game_pad))
    {
		game_pad_id = game_pad;
		gamepad_set_axis_deadzone(game_pad_id, 0.1);
		break;
	}
}
