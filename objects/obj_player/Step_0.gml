/// @description Player Input & New Wave

switch (global.player_state)
{
	case PLAYER_STATE.idle:
		sprite_index = spr_player;
		break;
	case PLAYER_STATE.moving:
		sprite_index = spr_player_exhaust;
		audio_play_sound(snd_player_engine, 10, false, .1);
		break;
	case PLAYER_STATE.exploding:
		sprite_index = spr_player_explosion;
		if (game_pad_id >=0 ) 
		{
			gamepad_set_vibration(game_pad_id, 1, 1);	// start vibration
			alarm[6] = room_speed / 2;	// set alarm to turn off vibration after .5 seconds
		}
		break;
	case PLAYER_STATE.dead:
		sprite_index = spr_player_inactive;
		break;
}

// player input
var left_pressed = false;
var right_pressed = false;
var fire_pressed = false;
var missle_pressed = false;
var bomb_pressed = false;

//var game_pad_axis_threshold = 0.1;
var speed_multiplier = 1;

// Handle GamePad Input
if ((game_pad_id >= 0 ))
{
	// D-Pad buttons
    if (gamepad_button_check(game_pad_id, gp_padl)) left_pressed = true;
    if (gamepad_button_check(game_pad_id, gp_padr)) right_pressed = true;
	
	// Buttons
    //if (gamepad_button_check(game_pad_id, gp_face1)) fire_pressed = true;	// A Button
    if (gamepad_button_check(game_pad_id, gp_face2)) fire_pressed = true;	// B Button
    if (gamepad_button_check(game_pad_id, gp_face3)) bomb_pressed = true;	// X Button	
    if (gamepad_button_check(game_pad_id, gp_face4)) missle_pressed = true;	// Y Button
    if (gamepad_button_check(game_pad_id, gp_shoulderrb)) fire_pressed = true;
    if (gamepad_button_check(game_pad_id, gp_shoulderlb)) bomb_pressed = true;	

	// Left Analog Stick Left and Right
	var gamepad_axislh_value = gamepad_axis_value(0, gp_axislh);
	//if (gamepad_axislh_value < - 1 * game_pad_axis_threshold) 
	if (gamepad_axislh_value < 0)
	{
		left_pressed = true;
		speed_multiplier = -1 * gamepad_axislh_value;
	}
	//if (gamepad_axislh_value > game_pad_axis_threshold) 
	if (gamepad_axislh_value > 0) 
	{
		right_pressed = true;
		speed_multiplier = gamepad_axislh_value;
	}

}

// Handle Keyboard Input
if (keyboard_check(vk_left)) left_pressed = true;
if (keyboard_check(vk_right)) right_pressed = true;
if (keyboard_check(vk_space)) fire_pressed = true;
if (keyboard_check(ord("M"))) missle_pressed = true;
if (keyboard_check(ord("B"))) bomb_pressed = true;

// React based on player input
if (left_pressed and x > sprite_width/2) 
{
	x -= global.player_speed * speed_multiplier;
	if (global.player_state == PLAYER_STATE.idle) 
		global.player_state = PLAYER_STATE.moving;
} 
else if (right_pressed and x < room_width - sprite_width/2) 
{
	x += global.player_speed * speed_multiplier;
	if (global.player_state == PLAYER_STATE.idle) 
		global.player_state = PLAYER_STATE.moving;
} 
else if (global.player_state == PLAYER_STATE.moving)
{
	global.player_state = PLAYER_STATE.idle;
}

// Handle Player Shooting
if (fire_pressed && fire_cooldown == false && global.player_state != PLAYER_STATE.dead)
{
	if (instance_number(obj_weapon_fire) < fire_max) 
	{
		// Fire a missle
		fire_cooldown = true;
		alarm[0] = fire_interval;	// milliseconds between shots
		instance_create_layer(x, y, "Instances_missles", obj_weapon_fire)
	}
}

if (missle_pressed && missle_cooldown == false && global.player_state != PLAYER_STATE.dead)
{
	if (instance_number(obj_weapon_missle) < missle_max) 
	{
		// Fire a missle
		missle_cooldown = true;
		alarm[0] = missle_interval;	// milliseconds between shots
		instance_create_layer(x, y, "Instances_missles", obj_weapon_missle)
	}
}

if (bomb_pressed && bomb_cooldown == false && global.player_state != PLAYER_STATE.dead)
{
	if (global.bomb_count > 0)
	{
		if (instance_number(obj_weapon_bomb) < bomb_max) 
		{
			// Fire a bomb
			bomb_cooldown = true;
			alarm[0] = bomb_interval;	// milliseconds between shots
			instance_create_layer(x, y, "Instances_missles", obj_weapon_bomb)
			global.bomb_count--;
		}
	}
}

//if (global.enemy_count == 1) && (instance_number(obj_boss1) == 1) && (global.player_state == PLAYER_STATE.dead)
if (instance_number(obj_enemy) == 1) && (instance_number(obj_boss1) == 1) && (global.player_state == PLAYER_STATE.dead)
{
	global.player_state = PLAYER_STATE.idle;
}

// Time to start a new wave?
//	|| ((global.enemy_count == 1) && (!waiting_for_next_wave) && (global.is_boss_wave))
//if ((global.enemy_count < 1) && (!waiting_for_next_wave))
if ((instance_number(obj_enemy) < 1) && (!waiting_for_next_wave))
{

	switch (global.player_state)
	{
		case PLAYER_STATE.dead:
			// Re-activate the player
			global.player_state = PLAYER_STATE.idle;
			break;
		default:
			// Increase the wave number
			global.enemy_wave++;
			audio_play_sound(snd_new_wave, 30, false);
			break;
	}

	// destroy existing missles
	// this with statement is a shortcut that applies to all obj_weapon_missle children objects
	if (global.destroy_player_missles_on_level_clear)
	{
		with(obj_weapon)
		{
			state = WEAPON_STATE.exploding;
			// play the explosion sound
			audio_play_sound(snd_missle1_explosion, 10, false);	
		}
	}
	
	// pause before starting next wave
	waiting_for_next_wave = true;
	alarm[1] = enemy_wave_pause; 

	// Randomly Create a Power Up
	alarm[7] = power_up_pause;

}

// boss wave?
//if ((global.enemy_wave mod global.boss1_wave_number) == 0)
//	&& (global.enemy_count < 1)	// don't generate a second boss!
if ((global.enemy_wave mod global.boss1_wave_number) == 0)
   && (instance_number(obj_boss1) == 0)
   && (!global.is_boss_dead)
{
	// start a boss1 wave
	var xx = room_width / 2;
	var yy = (sprite_height / 2) + 100;
	var boss_instance = instance_create_layer(xx, yy, "Instances", obj_boss1);
	// Increase the bosses health by a set percentage each boss wave
	boss_instance.enemy_health = boss_instance.enemy_health 
		+ (floor((global.enemy_wave - 1) / global.boss1_wave_number) * (boss_instance.enemy_health * global.boss_health_increase));
	boss_instance.enemy_health_max = boss_instance.enemy_health;
	
	global.is_boss_wave = true;

}

//// Randomly Create a Power Up
//if (global.player_state != PLAYER_STATE.dead) 
//{
//	// only allow one power-up at a time
//	if (instance_number(obj_power_up) < 1)
//	{
//		// randomly generate the power up
//		if (irandom_range(1, global.powerup_odds ) == 1)
//		{
//			var power_up = choose(obj_pu_free_life);
//			var xx = irandom_range(sprite_width/2, room_width - sprite_width/2);
//			var yy = 0;
//			var inst = instance_create_layer(xx, yy, "Instances_missles", power_up);
//			//audio_play_sound(snd_missle, 10, false, 1, 0, .5);
//		}
//	}
//}
