event_inherited();

sound_instance = undefined;

play = function(audio, loop = true) {
	sound_instance = audio_play_sound(audio, 0, loop);
}

pause = function() {
	audio_pause_sound(sound_instance);
}

stop = function() {
	audio_stop_sound(sound_instance);
}
