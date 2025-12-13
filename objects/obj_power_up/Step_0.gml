/// @description Insert description here
// You can write your code in this editor

// Set the sprite based on current state
switch (state)
{
	case POWER_UP_STATE.good:
		sprite_index = sprite_index_good;
		//image_speed = .5;
		break;

	case POWER_UP_STATE.pick_up:
		sprite_index = sprite_index_pickup;
		image_speed = .25;
		speed = 0;
		break;
}
