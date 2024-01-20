event_inherited();

arena = encouter.arena;
player = encouter.player;

attacks = [
	obj_pattern_circles,
	obj_pattern_lines,
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
