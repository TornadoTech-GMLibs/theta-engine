time = 0;

arena.set_size(126, 126);
parent.create_soul(obj_encouter_fight_soul_red, {
	x: arena.x,
	y: arena.y,
});

var center = new Vector2(arena.x, arena.y);
instance_create(obj_pattern_circle_to_center, {
	center: center,
	angle: 0,
	angle_speed: 5,
	period: 5,
	radius: 200,
	delay: 10,
	projectile: obj_projectile_tornado,
	arena: arena,
});
