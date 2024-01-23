if (!surface_exists(surface)) {
	surface = surface_create(room_width, room_height);
}

surface_set_target(surface); 
draw_clear_alpha(0, 0);
surface_reset_target();
