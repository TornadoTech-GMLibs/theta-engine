time = 0;

arena.set_size(126, 126);
parent.create_soul(obj_encouter_fight_soul_blue, {
	x: arena.x,
	y: arena.y,
});

instance_create(obj_pattern_projectile_circle_emitter, {
	x: arena.x,
	y: arena.y - arena.height / 2 - 100,
	period: 75,
	step: 15,
	angle_speed: 10,
	projectile: obj_projectile_tornado,
	arena: arena,
});
