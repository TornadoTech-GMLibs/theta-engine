time = 0;

arena.set_size(200, 150);
arena.add_position(new Vector2(0, -25));

parent.create_soul(obj_encouter_fight_soul_red, {
	x: arena.x,
	y: arena.y,
});

instance_create(obj_pattern_projectile_cone_emitter, {
	x: arena.x,
	y: arena.y - arena.size.y / 2 - 125,
	angle: 90,
	projectile: obj_projectile_tornado,
	arena: arena,
});
