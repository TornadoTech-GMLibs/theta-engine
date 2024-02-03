event_inherited();

projectile = obj_ecnouter_fight_soul_yellow_projectile;
sound = snd_heartshot;

shoot_time = 0;
shoot_cooldown = 0.2; // Seconds

shoot = function() {
	instance_create(projectile, {
		x: x,
		y: y,
		depth: depth - 1,
		image_angle: image_angle,
		direction: image_angle,
	});
	
	audio_play_sound(sound, 0, 0);
}
