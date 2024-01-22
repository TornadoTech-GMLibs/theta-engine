/// @param {Real} intensity
/// @param {Constant.Color} color
function shader_set_tone(intensity, color) {
	static uniform_tone = shader_get_uniform(shd_tone, "u_vTone");
	shader_set(shd_tone);
	shader_set_uniform_f(uniform_tone, color_get_red(color) / 255, color_get_green(color) / 255, color_get_blue(color) / 255, intensity);
}
