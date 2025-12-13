/// @description Insert description here

if (room == rm_game) {

	// restart the theme music
	if(audio_is_playing(snd_space_theme)){
		audio_stop_sound(snd_space_theme);
	}
	audio_play_sound(snd_space_theme, 5, true);
	
}
