depth = encouter_depth.enemy;

name = "Enemy";
hp = 100;
hp_max = 100;

damage_effect_offset = new Vector2(0, 0);
damage_text_offset = new Vector2(40, 0);

defense = 1;

actions = [];

/// @param {Real} damage
hurt = function(damage) {
	var _damage = max(damage - defense, 0);
	hp = max(hp - _damage, 0);
	
	instance_create_depth(x + damage_effect_offset.x, y + damage_effect_offset.y, depth - 1, obj_encouter_attack_weapon_effect);
	instance_create_depth(x + damage_text_offset.x, y + damage_text_offset.y, depth - 1, obj_encouter_attack_damage, {
		damage: _damage
	});
	
	if (damage > 0) {
		shake();
	}
}

kill = function() {

}

on_mercy = function() {

}

shake = function() {
	// TODO: Add realisation
}
