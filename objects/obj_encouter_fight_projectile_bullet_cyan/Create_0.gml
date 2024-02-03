event_inherited();

base_on_collide = on_collide;

/// @param {Id.Instance} soul
on_collide = function(soul) {
	if (soul.velocity.equals(vector2_zero)) return;
	base_on_collide(soul);
}
