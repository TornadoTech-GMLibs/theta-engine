shader_set_tone(wave(0, 1, 5), c_crimson);

if (arena.surface != undefined) {
	surface_set_target(arena.surface)
	draw_self();
	surface_reset_target();
}

shader_reset();
