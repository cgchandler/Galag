/// @description Insert description here

// Set the sprite based on current state
switch (state)
{

	case WEAPON_STATE.good:
		sprite_index = spr_missle1_flying;
		break;

	case WEAPON_STATE.exploding:
		sprite_index = spr_missle1_explosion;
		image_speed = .25;
		speed = 0;
		break;
}
