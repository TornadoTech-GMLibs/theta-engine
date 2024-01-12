destroy = function () {
	destroying = true;
}

damage_color = c_red;

missed_color = c_grey;
missed_text = "MISS";

alpha = 1;

destroy_delay = 0.3;
destroying = false;

destroy_timesource = time_source_create(time_source_game, destroy_delay, time_source_units_seconds, function() {
	destroy();
}, [], 1);

// TODO: NO FUCKING GRAVITY!!!
gravity_direction = 270;
gravity = 0.2;
motion_add(90, 3);
