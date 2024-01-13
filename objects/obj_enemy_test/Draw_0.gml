/// @desc Animation update
var wave_x = sin(current_time / 30 * pi / 60);
var wave_y = sin(current_time / 30 * pi / 30);

draw_sprite_pos(
	image_legs.sprite, 
	image_legs.subming,
	image_legs.x + wave_x,
	image_legs.y + wave_y,
	image_legs.x + wave_x + image_legs.width,
	image_legs.y + wave_y,
	image_legs.x + image_legs.width,
	image_legs.y + image_legs.height,
	image_legs.x,
	image_legs.y + image_legs.height,
	1
);

image_body.x = image_legs.x - 10 + wave_x;
image_body.y = image_legs.y - 46 + wave_y;
draw_sprite_pos(
	image_body.sprite,
	image_body.subming,
	image_body.x,
	image_body.y,
	image_body.x + image_body.width,
	image_body.y,
	image_body.x + image_body.width,
	image_body.y + image_body.height,
	image_body.x,
	image_body.y + image_body.height,
	1
);

image_head.x = image_body.x + 54 + wave_x;
image_head.y = image_body.y + 10 + wave_y;
draw_sprite_ext(
	image_head.sprite,
	image_head.subming,
	image_head.x,
	image_head.y,
	image_head.scale_x,
	image_head.scale_y,
	0,
	c_white,
	1
);
