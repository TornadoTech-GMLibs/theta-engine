if (selected_menu != undefined)
	exit;

// TODO: Add handler
if (input_pressed(input_source.left) && selected_button > 0) {
	selected_button--;
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.right) && selected_button < button_length - 1) {
	selected_button++;
	keyboard_clear(keyboard_lastkey);
}
	
if (input_pressed(input_source.select)) {
	selected_menu = selected_button;
	keyboard_clear(keyboard_lastkey);
}
