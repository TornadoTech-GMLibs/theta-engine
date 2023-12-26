function scribble_startup() {
	scribble_font_set_default("font_determination");
	scribble_font_bake_outline_8dir("font_determination", "font_determination_outline", c_black, false);
}
