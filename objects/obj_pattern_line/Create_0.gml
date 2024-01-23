if (!variable_instance_exists(id, "projectile")) {
	projectile = undefined;
}

if (!variable_instance_exists(id, "direction")) {
	direction = 0;
}

if (!variable_instance_exists(id, "step")) {
	step = 0;
}

if (!variable_instance_exists(id, "position")) {
	position = vector2_zero;
}

if (!variable_instance_exists(id, "target")) {
	target = vector2_zero;
}

while (!position.equals(target)) {
	position.x = approach(position.x, target.x, step);
	position.y = approach(position.y, target.y, step);
	
	instance_create(projectile, {
		x: position.x,
		y: position.y,
		direction: direction,
		arena: arena,
	});
}

instance_destroy();
