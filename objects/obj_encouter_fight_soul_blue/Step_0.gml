event_inherited();

image_angle = gravity_angle;

var gravity_vector = vector2_from_angle(gravity_angle).smulti(1, -1);
var gravity_velocity = gravity_vector.smulti(gravity_force);

var jump_vector = gravity_vector.smulti(-1, -1);

if (moveable) {
	// Input
	var input_direction = new Vector2(abs(gravity_velocity.y), abs(gravity_velocity.x));
	var input = new Vector2(
		(input_held(input_source.right) - input_held(input_source.left)),
		(input_held(input_source.down) - input_held(input_source.up))
	).multi(input_direction).get_normolize();
	
	var input_shift = input_held(input_source.skip);
	var input_jump = input_pressed(input_source.jump);
	
	// Horizontal velocity
	var previous_velocity = velocity;
	velocity = input.multi(movement_speed).smulti(input_shift ? 0.5 : 1);

	if (jump_vector.x != 0) {
		velocity.x = previous_velocity.x;
	}
	
	if (jump_vector.y != 0) {
		velocity.y = previous_velocity.y;
	}

	if (input_jump) {
		velocity = velocity.add(jump_vector.smulti(jump_force));
	}
}

velocity = velocity.add(gravity_velocity);

velocity.x = clamp(velocity.x, -10, 10);
velocity.y = clamp(velocity.y, -10, 10);
//velocity.x *= 10;

	//show_debug_message(velocity)
if (place_meeting(x + velocity.x, y, obj_encouter_arena_collision)) {
	while (!place_meeting(x + sign(velocity.x), y, obj_encouter_arena_collision)) {
		x += sign(velocity.x);
	}
	
	velocity.x = 0;
}

if (place_meeting(x, y + velocity.y, obj_encouter_arena_collision)) {
	while (!place_meeting(x, y + sign(velocity.y), obj_encouter_arena_collision)) {
		y += sign(velocity.y);
	}
	
	velocity.y = 0;
}

x += velocity.x;
y += velocity.y;
