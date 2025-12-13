/// @description Enemy Missle 1 Collision

if (global.player_state != PLAYER_STATE.dead)
{
	scr_player_hit(self, other);
}

// Allow a replacement shot without waiting for cooldown
//missle_cooldown = false;
