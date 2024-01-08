x += _speed * speed_scale;

if (x < 0 - sprite_height || 
	y < 0 - sprite_height || 
	x > room_width + sprite_height ||
	y > room_height + sprite_height) {
	instance_destroy();
}

if (rotating) {
	image_angle += 6 * sign(speed_scale);
}
