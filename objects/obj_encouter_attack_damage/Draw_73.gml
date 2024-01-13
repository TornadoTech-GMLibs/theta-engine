// TODO: Less hardcode, more fields
scribble(damage == 0 ? missed_text : string(damage))
	.starting_format("font_hachicro_outline", c_white)
	.blend(damage == 0 ? missed_color : damage_color, alpha)
	.align(fa_center, fa_middle)
	.transform(2, 2, 0)
	.draw(x, y);
