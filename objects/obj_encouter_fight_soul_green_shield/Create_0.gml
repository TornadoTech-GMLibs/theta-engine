event_inherited();

if (!variable_instance_exists(id, "soul")) {
	soul = noone;
	throw new NullReferenceException();
}

base_on_collide = on_collide;

sprite_index_time = 0;
sprite_index_delay = 0.2; // Seconds

/// @param {Id.Instance} projectile
on_collide = function(projectile) {
	// FUCK
	if (!projectile.destroyable) return;
	
	audio_play_sound(snd_bell, 0, 0);
	
	if (sprite_index_time <= 0) {
		image_index = 1;
		sprite_index_time += sprite_index_delay;
	}
	
	base_on_collide(projectile);
}
