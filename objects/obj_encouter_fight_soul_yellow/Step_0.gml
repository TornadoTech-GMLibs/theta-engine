event_inherited();

shoot_time -= real_delta_time;

if (input_pressed(input_source.select)) {
	if (shoot_time <= 0) {
		shoot();
		shoot_time += shoot_cooldown;
	}
}
