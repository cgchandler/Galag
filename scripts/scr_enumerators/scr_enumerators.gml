// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum ENEMY_TYPE
{
	enemy1,
	enemy2,
	enemy3,
	boss1
}

enum PLAYER_STATE
{
	idle,
	moving,
	exploding,
	invincible,
	shields,
	dead
}

enum ENEMY_STATE
{
	good,
	exploding,
	damaged,
	dead
}

enum WEAPON_STATE
{
	good,
	exploding
}

enum POWER_UP_TYPE
{
	free_life,
	bomb
}

enum POWER_UP_STATE 
{
	good,
	pick_up
}