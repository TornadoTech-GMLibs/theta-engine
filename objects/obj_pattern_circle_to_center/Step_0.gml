if (time % period == 0) {
	var position = new Vector2(
		center.x + lengthdir_x(radius, angle),
		center.y + lengthdir_y(radius, angle)
	);
	
	instance_create(projectile, {
		x: position.x,
		y: position.y,
		delay: delay,
		direction: center.copy().sub(position).get_angle(),
	});
	
	angle += angle_speed;
	
	if (angle > 360) {
		angle -= 360;
	}
}

time++;
