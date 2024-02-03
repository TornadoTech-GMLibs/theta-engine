event_inherited();

/// @param {Id.Instance} projectile
on_collide = function(projectile) {
	if (!projectile.destroyable) return;
	instance_destroy(projectile);
}
