/// @description Insert description here
// You can write your code in this editor

score = 0;
lives = 3;

// Start the Theme Music
audio_play_sound(snd_space_theme, 5, true);

// for synchronizing scrolling background between rooms
global.background_yoffset_bg = 0;
global.background_yoffset_stars = 0;
global.background_yoffset_planets = 0;
global.background_yoffset_meteors = 0;

// get an extra life for every X points
global.extra_life_score = 500;

// enemy wave
global.enemy2_wave_number = 5;
global.enemy3_wave_number = 10;
global.boss1_wave_number = 5;

// attack odds (1 in x)
global.enemy_attack_odds = 250;
global.boss_attack_odds = 75;

// blow up all this missles when the player completes a level - makes game more difficult
global.destroy_player_missles_on_level_clear = true;

global.is_boss_dead = false;

// increase the boss health per boss wave
global.boss_health_increase = .25;

// odds of a power-up appearing at beggining of a level (1 in N steps)
global.powerup_odds = 3;

// limit the number of bombs
global.bomb_count = 5;

// load the high score
highscore_load();
