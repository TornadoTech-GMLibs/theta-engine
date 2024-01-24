if (time % period == 0) {
	var angle = angle_offset;
	while (angle < 360 + angle_offset) {
		var position = new Vector2(
			x + lengthdir_x(radius, angle),
			y + lengthdir_y(radius, angle)
		);
			
		instance_create(projectile, {
			x: x,
			y: y,
			delay: delay,
			direction: angle,
			arena: arena,
		});
		
		angle += step;
	}
	
	angle_offset += angle_speed;
}

time++;
