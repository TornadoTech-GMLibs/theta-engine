damage_color = c_red;
missed_color = c_grey;
missed_text = "MISS";
alpha = 1;

destroying = false;
destroy = function () {
	destroying = true;
}

destroy_timesource = time_source_create(time_source_game, 0.3, time_source_units_seconds, function() {
	destroy();
}, [], 1);
	
gravity_direction = 270;
gravity = 0.2;
motion_add(90, 3);
