/// @param {Real} intensity
function shader_set_inverting(intensity) {
	static uniform_alpha = shader_get_uniform(shd_inverting, "u_vAlpha");
	shader_set(shd_inverting);
	shader_set_uniform_f(uniform_alpha, intensity);
}
