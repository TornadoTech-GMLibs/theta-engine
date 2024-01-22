var position = new Vector2(room_width / 2, room_height / 2);

start_button = new TextButton("Start fight", position, function() {
	encouter_start(obj_encouter_test);
});

exit_button = new TextButton("Exit fight", position.sadd(0, 40), function() {
	game_end();
});
