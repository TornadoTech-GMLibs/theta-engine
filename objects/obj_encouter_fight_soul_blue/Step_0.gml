event_inherited();

image_angle = gravity_angle;
var gravity_vector = vector2_from_angle(gravity_angle).smulti(1, -1);
var gravity_velocity = gravity_vector.smulti(gravity_force);

if (moveable) {
	var input = new Vector2(
		(input_held(input_source.right) - input_held(input_source.left)) * gravity_velocity.y,
		(input_held(input_source.down) - input_held(input_source.up)) * gravity_velocity.x
	).get_normolize();
	
	var input_shift = input_held(input_source.skip);
	
	velocity = input.multi(movement_speed).smulti(input_shift ? 0.5 : 1);
	
	if (input_pressed(input_source.jump)) {
		var jump_vector = gravity_vector.smulti(-1, -1);
		velocity = velocity.add(jump_vector.smulti(jump_force));
	}
}

velocity = velocity.add(gravity_velocity);
show_debug_message(velocity);
move_and_collide(velocity.x, velocity.y, obj_encouter_arena_collision);
