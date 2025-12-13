/// @description Destroy the object when explosion is complete

if (state = ENEMY_STATE.exploding)
{
	instance_destroy();
}
