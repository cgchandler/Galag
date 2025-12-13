/// @description Insert description here

if (state = ENEMY_STATE.exploding)
{
	state = ENEMY_STATE.dead;
}
else if (state = ENEMY_STATE.dead)
{
	instance_destroy();
}
