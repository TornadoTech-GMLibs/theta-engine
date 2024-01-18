if (destroying) {
	attack_xscale = lerp(attack_xscale, 0, 0.5);
	
	if (attack_xscale < 0.09) {
		instance_destroy();
	}
	
	exit;
}

if (stop) exit;

pointer.speed_scale = (2.5 - abs(pointer.x / (attack_x + attack_width / 2) - 0.5) * 2) * _direction;

if (input_pressed(input_source.select)) {
	pointer.image_speed = 1;
	pointer._speed = 0;
	
	var damage_scale = 1 - abs(pointer.x / (attack_x + attack_width / 2) - 0.5);
	if (damage_scale <= 0.7) {
		damage_scale = 0;
	}
	
	hurt(round(encouter.player.damage * damage_scale));
	stop = true;
	time_source_start(destroy_timesource);
}

if (input_pressed(input_source.skip)) {
	hurt(0);
	destroy();
}

if (pointer.x > attack_x + attack_width / 2 + 30 && _direction == 1) {
	hurt(0);
	destroy();
}
	
if (pointer.x < attack_x - attack_width / 2 - 30 && _direction == -1) {
	hurt(0);
	destroy();
}

attack_xscale = lerp(attack_xscale, 1, 0.3);
