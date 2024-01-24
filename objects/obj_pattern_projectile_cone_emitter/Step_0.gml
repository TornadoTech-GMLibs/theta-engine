if (time % period == 0) {
	var new_angle = irandom_range(min_angle + angle, max_angle + angle);
	
	instance_create(projectile, {
		x: x,
		y: y,
		delay: delay,
		direction: new_angle,
		arena: arena,
	});
}

time++;
