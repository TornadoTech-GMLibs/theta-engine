// TODO: Less hardcode, more fields
scribble(damage == 0 ? missed_text : string(damage))
	.starting_format("font_hachicro_outline", c_white)
	.blend(damage == 0 ? missed_color : damage_color, alpha)
	.align(fa_center, fa_middle)
	.transform(2, 2, 0)
	.draw(x, y);

draw_set_alpha(alpha);
draw_sprite(spr_ui_encouter_menu_bar_background, 0, x - 67, y + 36);
draw_sprite_field(spr_ui_encouter_menu_bar_hp, 0, x - 67, y + 36, hp / hp_max);
draw_set_alpha(1);
