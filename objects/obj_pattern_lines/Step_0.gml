if (time >= 480) {
	fight.finish();
}

if (time % 60 == 0) {
	var offset_y = 0;
	instance_create(obj_pattern_line, {
		position: new Vector2(arena.x - arena.width / 2, arena.y + arena.height / 2 + offset_y),
		target: new Vector2(arena.x - arena.width / 2, arena.y + offset_y),
		step: 20,
		direction: 0,
		projectile: obj_projectile_tornado,
		arena: arena,
	});

	instance_create(obj_pattern_line, {
		position: new Vector2(arena.x + arena.width / 2, arena.y + offset_y),
		target: new Vector2(arena.x + arena.width / 2, arena.y - arena.height / 2 + offset_y),
		step: 20,
		direction: 180,
		projectile: obj_projectile_tornado,
		arena: arena,
	});
}

time++;
