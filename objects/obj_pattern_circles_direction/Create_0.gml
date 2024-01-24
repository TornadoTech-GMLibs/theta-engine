time = 0;

arena.set_size(126, 126);
parent.create_soul(obj_encouter_fight_soul_red, {
	x: arena.x,
	y: arena.y + arena.height / 2 - 16,
});

instance_create(obj_pattern_circle_to_direction, {
	x: arena.x,
	y: arena.y,
	period: 5,
	radius: 0,
	angle_speed: 10,
	projectile: obj_projectile_tornado,
	arena: arena,
});

instance_create(obj_pattern_circle_to_direction, {
	x: arena.x,
	y: arena.y,
	period: 5,
	angle: 180,
	angle_speed: 10,
	radius: 0,
	projectile: obj_projectile_tornado,
	arena: arena,
});
