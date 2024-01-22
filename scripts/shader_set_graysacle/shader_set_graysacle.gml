/// @param {Real} intensity
function shader_set_graysacle(intensity) {
	static uniform_alpha = shader_get_uniform(shd_grayscale, "u_vAlpha");
	shader_set(shd_grayscale);
	shader_set_uniform_f(uniform_alpha, intensity);
}
