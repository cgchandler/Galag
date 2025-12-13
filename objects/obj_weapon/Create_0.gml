/// @description Insert description here

speed = 5;
direction = 90;
image_speed = .5;
audio_play_sound(shooting_sound_index, 10, false);
state = WEAPON_STATE.good;

// assign a random number as a uniqueid
unique_id = irandom(1000000);
