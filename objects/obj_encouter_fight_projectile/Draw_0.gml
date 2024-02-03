if (arena.surface != undefined && draw_inside_arena) {
	surface_set_target(arena.surface)
	draw_self();
	surface_reset_target();
	exit;
}

draw_self();
