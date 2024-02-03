depth = encouter_depth.bullet_outside;

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
	throw new Exception();
}

encouter = arena.encouter;
player = encouter.player;

// Damage caused by a bullet to a player
damage = 4;

// Will the bullet be destroyed on the shield of a green soul,
// a yellow bullet, etc.
destroyable = true;

// Will a bullet disintegrate after contact with a soul
destroy_after_collide = false;

// How much invulnerability the bullet will give the player after touching it
invulnerability_frames = 20;

// Will the bullet only be displayed inside the arena
draw_inside_arena = false;

/// @param {Id.Instance} soul
on_collide = function(soul) {
	if (soul.invulnerability_frames > 0) 
		return;
	
	soul.hurt(damage, invulnerability_frames, id);
	
	if (destroy_after_collide) {
		instance_destroy();
	}
}
