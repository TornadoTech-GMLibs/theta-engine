event_inherited();

if (!variable_instance_exists(id, "arena")) {
	arena = noone;
}

depth = encouter_depth.soul;

velocity = vector2_zero;
movement_speed = new Vector2(3.5);
moveable = true;

invulnerability_frames = 0;

/// @param {Real} damage
/// @param {Real} frames
/// @param {Id.Instance} source
/// @param {Bool} force
hurt = function(damage, frames, source) {
	invulnerability_frames = frames;
	audio_play_sound(snd_hurt, 0, false);
	player.hurt(damage);
}
