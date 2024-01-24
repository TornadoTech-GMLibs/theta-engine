event_inherited();

depth = encouter_depth.bullet_outside;

invulnerability_frames = 60;
movement_speed = new Vector2(3);

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
}

if (!variable_instance_exists(id, "delay")) {
	delay = 0;
}

if (!variable_instance_exists(id, "direction")) {
	direction = 0;
}
