// TODO: Remade this shit
depth = -9999;
_speed = 4;
speed_scale = 1;
image_speed = 0;
rotating = false;

destroy = function () {
	gravity_direction = 270;
	gravity = 0.34;
	motion_add(sign(speed_scale) == 1 ? 45 : 135, 3);
	_speed = 0;
	rotating = true;
}
