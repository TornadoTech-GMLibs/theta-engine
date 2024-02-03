event_inherited();

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
}

depth = encouter_depth.soul;

invulnerability_frames = 0;

velocity = vector2_zero;

color = c_white;
color_hurt = c_dkgray;
invulnerability_color_time_source = time_source_create(time_source_game, 0.15, time_source_units_seconds, function() {
	image_blend = image_blend == color ? color_hurt : color;
}, [], -1);

/// @param {Real} damage
/// @param {Real} frames
/// @param {Id.Instance} source
/// @param {Bool} force
hurt = function(damage, frames, source) {
	invulnerability_frames = frames;
	audio_play_sound(snd_hurt, 0, false);
	player.hurt(damage);
	time_source_start(invulnerability_color_time_source);
}
