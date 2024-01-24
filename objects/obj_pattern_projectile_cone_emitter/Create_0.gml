time = 0;

if (!variable_instance_exists(id, "period")) {
	period = 10;
}

if (!variable_instance_exists(id, "angle")) {
	angle = 0;
}

if (!variable_instance_exists(id, "min_angle")) {
	min_angle = -40;
}

if (!variable_instance_exists(id, "max_angle")) {
	max_angle = 40;
}

if (!variable_instance_exists(id, "delay")) {
	delay = 0;
}

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
	throw new NullReferenceException();
}
