destroy = function () {
	destroying = true;
}

damage_color = c_red;

missed_color = c_grey;
missed_text = "MISS";

alpha = 1;

destroy_delay = 1.2;
destroying = false;

fall_timesource = time_source_create(time_source_game, destroy_delay, time_source_units_seconds, function() {
	// TODO: NO FUCKING GRAVITY!!!
	gravity_direction = 270;
	gravity = 0.2;
	motion_add(90, 3);
	destroy();
}, [], 1);

time_source_start(fall_timesource);
