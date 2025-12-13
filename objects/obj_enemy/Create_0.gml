/// @description Setup the enemy

//global.enemy_count++;

speed = 3;
direction = irandom_range(225, 315);	// headed down
image_angle = 180;	// flip the ship upside down for attacking from the top

firing_odds = global.enemy_attack_odds;
