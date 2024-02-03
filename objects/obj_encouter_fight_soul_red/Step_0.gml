event_inherited();

if (moveable) {
	velocity = vector2_zero;

	var input = new Vector2(
		input_held(input_source.right) - input_held(input_source.left), 
		input_held(input_source.down) - input_held(input_source.up)
	).get_normolize();

	var input_shift = input_held(input_source.skip);

	velocity = velocity.add(input.multi(movement_speed).smulti(input_shift ? 0.5 : 1));
	move_and_collide(velocity.x, velocity.y, obj_encouter_arena_collision);
}
