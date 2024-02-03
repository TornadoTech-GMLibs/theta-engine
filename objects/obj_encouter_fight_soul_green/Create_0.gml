event_inherited();

shield = obj_encouter_fight_soul_green_shield;
shield_instance = instance_create(shield, {
	soul: id,
	x: x,
	y: y,
	depth: depth,
	image_angle: image_angle,
});

target_angle = image_angle;
target_amount = 1;
