/// @description Insert description here

// Set the sprite based on current state
switch (state)
{
	case WEAPON_STATE.good:
		sprite_index = sprite_index_good;
		//image_speed = .5;
		break;

	case WEAPON_STATE.exploding:
		sprite_index = sprite_index_exploding;
		image_speed = .25;
		speed = 0;
		break;
}