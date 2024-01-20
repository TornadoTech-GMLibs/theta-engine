broken_time_source = time_source_create(time_source_game, 1.1, time_source_units_seconds, function() {
	sprite_index = spr_encouter_fight_soul_red_broken_shard;
	audio_play_sound(snd_break_1, 0, false);
	
	time_source_start(shards_time_source);
}, [], 1);

shards_time_source = time_source_create(time_source_game, 0.9, time_source_units_seconds, function() {
	instance_destroy();
	audio_play_sound(snd_break_2, 0, false);
	
	repeat (6) {
		instance_create(obj_encouter_game_over_soul_shard, {
			x: x,
			y: y,
		});
	}
}, [], 1);

time_source_start(broken_time_source);
