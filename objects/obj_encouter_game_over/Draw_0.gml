draw_self();

scribble("Give up")
	.blend(selected_button == 0 ? c_yellow : c_white, image_alpha)
	.align(fa_center, fa_middle)
	.transform(2, 2, 0)
	.line_height(16, 16)
	.draw(room_width / 2 - 90, room_height / 2);

scribble("Continue")
	.blend(selected_button == 1 ? c_yellow : c_white, image_alpha)
	.align(fa_center, fa_middle)
	.transform(2, 2, 0)
	.line_height(16, 16)
	.draw(room_width / 2 + 90, room_height / 2);
	