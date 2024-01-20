x = room_width / 2;
y = room_height / 2 - 100;

var position = global.__engine_encouter_soul_position;
instance_create(obj_encouter_game_over_soul, {
	x: position.x,
	y: position.y,
});

image_alpha = 0;

appearance = false;

appearance_delay_time_source = time_source_create(time_source_game, 3, time_source_units_seconds, function() {
	appearance = true;
	audio_play_sound(snd_game_over, 0, true);
}, [], 1);

time_source_start(appearance_delay_time_source);
