/// @description Insert description here

// Set the sprite based on current state
switch (state)
{

	case ENEMY_STATE.good:
		sprite_index = sprite_index_good;
		image_speed = .5;
		scr_boss_move(self);
		break;

	case ENEMY_STATE.damaged:
		sprite_index = sprite_index_damaged;
		image_speed = .5;
		scr_boss_move(self);
		break;
	
	case ENEMY_STATE.exploding:
		sprite_index = sprite_index_exploding;
		image_speed = .5;
		speed = 0;
		break;
}
