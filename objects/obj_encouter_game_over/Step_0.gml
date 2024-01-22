if (!appearance) exit;

image_alpha = lerp(image_alpha, 1, 0.2);

if (input_pressed(input_source.left) && selected_button > 0) {
	selected_button--;
	audio_play_sound(snd_ui_selecting, 0, false);
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.right) && selected_button < 2) {
	selected_button++;
	audio_play_sound(snd_ui_selecting, 0, false);
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.select)) {
	audio_play_sound(snd_ui_select, 0, false);
	keyboard_clear(keyboard_lastkey);
	
	audio_stop_sound(audio_instance);
	
	switch (selected_button) {
		case 0:
			room_goto(room_menu);
			break;
		
		case 1:
			encouter_start(obj_encouter_test);
			break;
	}
}

