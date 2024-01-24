event_inherited();

arena = encouter.arena;
player = encouter.player;

attacks = [
	//obj_pattern_circles_direction,
	//obj_pattern_circles_center,
	//obj_pattern_lines,
	//obj_pattern_one_cone,
	obj_pattern_circles
];

start = function() {
	instance_create(array_pick(attacks), {
		encouter: encouter,
		arena: arena,
		player: player,
		fight: fight,
		parent: id,
	});
}
