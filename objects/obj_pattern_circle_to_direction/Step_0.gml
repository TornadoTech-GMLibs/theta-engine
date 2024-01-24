if (time % period == 0) {
	var position = new Vector2(
		x + lengthdir_x(radius, angle),
		y + lengthdir_y(radius, angle)
	);
	
	instance_create(projectile, {
		x: position.x,
		y: position.y,
		delay: delay,
		direction: angle,
		arena: arena,
	});
	
	angle += angle_speed;
	
	if (angle > 360) {
		angle -= 360;
	}
}

time++;
