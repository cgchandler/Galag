/// @description Insert description here

event_inherited();

points = 250;
enemy_health = 20;
enemy_health_max = enemy_health;
enemy_type = ENEMY_TYPE.boss1;

sprite_index_good = spr_boss1_idle1;
sprite_index_damaged = spr_boss1_attack1;
sprite_index_exploding = spr_boss1_death;

// Override the base object values
speed = 1;	// Overwrite
direction = choose(180, 0); // left or right
image_angle = 0; // override the base value of 180 to keep sprite right side up

// reduce the odds of firing for each round with a minimum of 50% of the max
firing_odds = max(global.boss_attack_odds * .5, global.boss_attack_odds - (1 - global.enemy_wave * 10));
