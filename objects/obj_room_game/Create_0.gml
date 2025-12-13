/// @description Insert description here
// You can write your code in this editor

// sync up the background
layer_y(layer_get_id("Background"), global.background_yoffset_bg);
layer_y(layer_get_id("Background_stars"), global.background_yoffset_stars);
layer_y(layer_get_id("Background_planets"), global.background_yoffset_planets);
layer_y(layer_get_id("Background_meteors"), global.background_yoffset_meteors);

// for minmizing the number of active missles
//global.missle_count = 0;

// Current enemy wave
global.enemy_wave = 0;
//global.enemy_count = 0;
global.is_boss_wave = false;

global.player_speed = 3;