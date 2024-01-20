gravity_direction = 270;
gravity = 0.2;
motion_add(irandom_range(45, 175), irandom_range(2, 5));

image_index = irandom_range(0, image_number - 1);

destroy_time_source = time_source_create(time_source_game, 4, time_source_units_seconds, function() {
	instance_destroy();
}, [], 1);
time_source_start(destroy_time_source);
