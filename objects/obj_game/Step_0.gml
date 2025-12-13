/// @description Insert description here
// You can write your code in this editor

var start_pressed = false;

// Handle GamePad Input
var max_pads = gamepad_get_device_count();
for (var game_pad = 0; game_pad < max_pads; game_pad++)
{
    if (gamepad_is_connected(game_pad))
    {
        if (gamepad_button_check(game_pad, gp_face1)) start_pressed = true;
        if (gamepad_button_check_pressed(game_pad, gp_start)) start_pressed = true;
    }
}

// Handle Keyboard Input
if (keyboard_check(vk_enter)) start_pressed = true;

// React based on player input
if (start_pressed)
{
	global.background_yoffset_bg = layer_get_y("Background");
	global.background_yoffset_stars = layer_get_y("Background_stars");
	global.background_yoffset_planets = layer_get_y("Background_planets");
	global.background_yoffset_meteors = layer_get_y("Background_meteors");
	switch(room)
	{
		case rm_start:
			room_goto(rm_game);
			break;
		case rm_gameover:
			//game_restart();
			score = 0;
			lives = 3;
			global.bomb_count = 5;			
			room_goto(rm_start);
			alarm[0] = 10 * room_speed;
			break;
	}
}

if (room == rm_game) 
{
	if (lives <= 0)
	{
		global.background_yoffset_bg = layer_get_y("Background");
		global.background_yoffset_stars = layer_get_y("Background_stars");
		global.background_yoffset_planets = layer_get_y("Background_planets");
		global.background_yoffset_meteors = layer_get_y("Background_meteors");
		room_goto(rm_gameover);
	}
}


