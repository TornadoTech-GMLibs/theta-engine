depth = -600;

damage = 4;
destroy_after_collide = false;
invulnerability_frames = 20;

on_collide = function(soul) {
	if (soul.invulnerability_frames > 0) 
		return;
	
	soul.hurt(damage, invulnerability_frames, id);
	
	if (destroy_after_collide) {
		instance_destroy();
	}
}
