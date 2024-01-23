if (encouter.state != encouter_state.selecting)
	exit;

if (selected_menu != undefined)
	exit;

// TODO: Add handler
// TODO: Sounds to other component
if (input_pressed(input_source.left) && selected_button > 0) {
	selected_button--;
	audio_play_sound(snd_ui_selecting, 0, false);
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.right) && selected_button < button_length - 1) {
	selected_button++;
	audio_play_sound(snd_ui_selecting, 0, false);
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.select)) {
	selected_menu = selected_button;
	encouter.set_state(encouter_state.in_menu);
	audio_play_sound(snd_ui_select, 0, false);
	keyboard_clear(keyboard_lastkey);
}
