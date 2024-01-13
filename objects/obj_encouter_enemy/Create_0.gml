name = "Enemy";
hp = 100;
hp_max = 100;

damage_offset_x = 40;
damage_offset_y = 0;

defense = 1;

actions = [];

/// @param {Real} damage
hurt = function(damage) {
	var _damage = max(damage - defense, 0);
	hp = max(hp - _damage, 0);
	
	instance_create_depth(x + damage_offset_x, y + damage_offset_y, depth - 1, obj_encouter_attack_damage, {
		damage: _damage
	});
}

kill = function () {

}

on_mercy = function() {

}
