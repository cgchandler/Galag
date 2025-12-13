/// @description Award Power Up

if (global.player_state != PLAYER_STATE.dead)
{
	scr_player_hit_powerup(self, other);
}
