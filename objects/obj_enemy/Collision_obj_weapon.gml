/// @description Insert description here
// You can write your code in this editor

if (other.state == WEAPON_STATE.good) || (other.explosion_causes_damage)
{
	// avoid an explosion from causing additional damage to same enemy when explosion_causes_damage enabled
	if (collision_object_id != other.unique_id)
	{
		collision_object_id	 = other.unique_id;
		scr_weapon_hit_enemy(other, self);
	}
}
