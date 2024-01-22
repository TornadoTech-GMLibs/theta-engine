global.__engine_encouter_soul_position = new Vector2(x, y);

image_blend = c_white;
if (invulnerability_frames > 0) {
	invulnerability_frames = approach(invulnerability_frames, 0, 1);
		
	var color_index = wave(1, -1, 1, 0); 
	if (color_index > 0) {
		image_blend = make_color_rgb(90, 90, 90);
	}
}

if (!moveable) exit;

velocity = vector2_zero;

var input = new Vector2(
	input_held(input_source.right) - input_held(input_source.left), 
	input_held(input_source.down) - input_held(input_source.up)
).get_normolize();

var input_shift = input_held(input_source.skip);

velocity = velocity.add(input.multi(movement_speed).smulti(input_shift ? 0.5 : 1));

move_and_collide(velocity.x, velocity.y, obj_encouter_arena_collision);
