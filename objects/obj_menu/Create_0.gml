var position = new Vector2(room_width / 2, room_height / 2);
var scale = new Vector2(2);

start_button = new SpriteButton(spr_ui_encouter_button_fight, position, function() {
	encouter_start(obj_encouter_test);
}).set_scale(scale).set_color(c_crimson, c_light_coral).set_subming(0, 0);

exit_button = new TextButton("Exit fight", position.sadd(0, 40), function() {
	game_end();
}).set_scale(scale);
