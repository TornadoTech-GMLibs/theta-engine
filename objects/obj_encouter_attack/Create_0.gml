depth = encouter_depth.text;

// import: encouter, target
var arena = encouter.arena;

attack_sprite = spr_ui_encouter_target;
attack_x = arena.x;
attack_y = arena.y;
attack_xscale = 0;
attack_yscale = 1;
attack_width = sprite_get_width(attack_sprite);

_direction = choose(1, -1);

pointer = instance_create_depth(attack_x - attack_width / 2 * _direction - 30 * _direction, attack_y, 0, obj_encouter_attack_pointer);

destroying = false;
destroy = function () {
	destroying = true;
}

destroy_timesource = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	destroy();
}, [], 1);

hurt = function(damage) {
	encouter.enemy_hurt(target, damage);
}

stop = false;
