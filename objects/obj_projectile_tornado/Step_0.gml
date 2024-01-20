event_inherited();

if (delay > 0) {
	delay = approach(delay, 0, 1);
	return;
}

x += dcos(direction) * movement_speed.x;
y += dsin(direction) * movement_speed.y;
