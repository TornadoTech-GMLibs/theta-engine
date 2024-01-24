time = 0;

if (!variable_instance_exists(id, "period")) {
	period = 10;
}

if (!variable_instance_exists(id, "radius")) {
	radius = 100;
}

if (!variable_instance_exists(id, "angle")) {
	angle = 0;
}

if (!variable_instance_exists(id, "angle_speed")) {
	angle_speed = 5;
}

if (!variable_instance_exists(id, "delay")) {
	delay = 0;
}

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
	throw new NullReferenceException();
}
