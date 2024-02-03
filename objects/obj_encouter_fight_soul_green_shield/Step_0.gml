event_inherited();

x = soul.x;
y = soul.y;
image_angle = soul.image_angle;

sprite_index_time = approach(sprite_index_time, 0, real_delta_time);

if (image_index == 1 && sprite_index_time <= 0) {
	image_index = 0;
}
