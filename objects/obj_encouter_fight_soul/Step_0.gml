global.__engine_encouter_soul_position = new Vector2(x, y);

if (invulnerability_frames > 0) {
	invulnerability_frames = approach(invulnerability_frames, 0, 1);
		
	if (invulnerability_frames == 0) {
		time_source_stop(invulnerability_color_time_source);
		image_blend = color;
	}
}
