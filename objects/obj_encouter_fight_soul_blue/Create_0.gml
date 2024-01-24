event_inherited();

velocity = vector2_zero;
movement_speed = new Vector2(2);
moveable = true;
jump_force = 30;

if (!variable_instance_exists(id, "gravity_force")) {
	gravity_force = 4;
}

if (!variable_instance_exists(id, "gravity_angle")) {
	gravity_angle = 270;
}

if (!variable_instance_exists(id, "gravity_clamp")) {
	gravity_clamp = new Vector2();
}
